import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import '../font_scaler.dart';
import '../constants.dart';
import '../providers/timetable.dart';
import '../providers/timetable_visibility.dart';

@immutable
class TimetableTile extends ConsumerWidget {
  const TimetableTile({super.key, required this.row, required this.col});

  final int row, col;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timetable? timetable = ref.watch(timetableProvider);
    TimetableVisibility? visibility = ref.watch(timetableVisibilityProvider);
    if (timetable == null || visibility == null) {
      return const SizedBox.shrink();
    }

    List<Subject> subjects = timetable.list[row][col];
    int? selected = visibility.list[row][col];
    if (subjects.isEmpty && selected != null) {
      throw const SizedBox.shrink();
    }

    if (selected != null) {
      Subject subject = subjects[selected];

      final color =
          Uint8List.fromList(sha256.convert(utf8.encode(subject.id)).bytes)
                  .buffer
                  .asByteData()
                  .getUint32(0, Endian.little) %
              palette.length;

      return GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(2),
          child: AspectRatio(
            aspectRatio: 0.75,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  constraints: const BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    color: palette[color][100],
                    border: Border.all(
                      color: palette[color][200]!,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    subject.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: TextStyle(
                      height: 1.2,
                      color: Colors.black87,
                      fontSize: 12.scale(context),
                    ),
                  ),
                ),
                if (subject.room != null)
                  Container(
                    width: double.infinity,
                    height: 22.scale(context),
                    padding: const EdgeInsets.all(2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: palette[color][200],
                      borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(4),
                      ),
                    ),
                    child: Text(
                      subject.room!,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.scale(context),
                        color: Colors.black87,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => _SubjectDetailsDialog(subject: subject),
          );
        },
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) => _SubjectSelectorDialog(row: row, col: col),
          );
        },
      );
    } else {
      return GestureDetector(
        child: Container(
          margin: const EdgeInsets.all(2),
          child: AspectRatio(
            aspectRatio: 0.75,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onInverseSurface,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        onLongPress: () {
          showDialog(
            context: context,
            builder: (context) => _SubjectSelectorDialog(row: row, col: col),
          );
        },
      );
    }
  }
}

@immutable
class _SubjectDetailsDialog extends StatelessWidget {
  const _SubjectDetailsDialog({required this.subject});

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(subject.name),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${subject.term} ${subject.required}'),
            if (subject.units != null) Text('単位数: ${subject.units}'),
            if (subject.area != null) Text('区分: ${subject.area}'),
            if (subject.staff != null) Text('担当教員: ${subject.staff}'),
            if (subject.room != null) Text('教室: ${subject.room}'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("シラバス"),
          onPressed: () async {
            await launchUrl(
              Uri.parse(subject.url),
              customTabsOptions: const CustomTabsOptions(),
              safariVCOptions: const SafariViewControllerOptions(),
            );
          },
        ),
        TextButton(
          child: const Text("閉じる"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

@immutable
class _SubjectSelectorDialog extends ConsumerWidget {
  const _SubjectSelectorDialog({required this.row, required this.col});

  final int row, col;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Timetable? timetable = ref.watch(timetableProvider);
    TimetableVisibility? visibility = ref.watch(timetableVisibilityProvider);
    if (timetable == null || visibility == null) {
      return const SizedBox.shrink();
    }

    List<Subject> subjects = timetable.list[row][col];
    int? selected = visibility.list[row][col];
    if (subjects.isEmpty && selected != null) {
      throw const SizedBox.shrink();
    }

    return SimpleDialog(
      title: Text('${weekdays[col + 1]}曜 ${row + 1}限 の科目を選択'),
      children: [
        ...subjects.asMap().entries.map<Widget>((item) {
          return SimpleDialogOption(
            onPressed: () async {
              visibility.list[row][col] = item.key;
              await ref
                  .read(timetableVisibilityProvider.notifier)
                  .update(TimetableVisibility(list: visibility.list));
              Navigator.of(context).pop();
            },
            child: Text(
              '${item.value.name} (${item.value.staff})',
              overflow: TextOverflow.ellipsis,
            ),
          );
        }),
        SimpleDialogOption(
          onPressed: () async {
            visibility.list[row][col] = null;
            await ref
                .read(timetableVisibilityProvider.notifier)
                .update(TimetableVisibility(list: visibility.list));
            Navigator.of(context).pop();
          },
          child: const Text('非表示'),
        )
      ],
    );
  }
}

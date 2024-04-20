import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:tutility/font_scaler.dart';
import 'package:tutility/providers/timetable.dart';
import 'package:tutility/widgets/timetable_base_tile.dart';
import 'package:url_launcher/url_launcher.dart';

const List<MaterialColor> _palette = [
  Colors.pink,
  Colors.red,
  Colors.deepOrange,
  Colors.orange,
  Colors.amber,
  Colors.yellow,
  Colors.lime,
  Colors.lightGreen,
  Colors.green,
  Colors.teal,
  Colors.cyan,
  Colors.lightBlue,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
  Colors.deepPurple,
];

@immutable
class TimetableSubjectTile extends StatelessWidget {
  final Subject subject;

  const TimetableSubjectTile({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    final color = _palette[_paletteIndexFromSubjectId(subject.id)];

    return GestureDetector(
      child: TimetableBaseTile(
        backgroundColor: color[100]!,
        borderColor: color[200]!,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2),
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
            ),
            if (subject.room != null)
              Container(
                height: 22.scale(context),
                padding: const EdgeInsets.all(2),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: color[200]),
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
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => _SubjectDetailsDialog(subject: subject),
        );
      },
    );
  }
}

@immutable
class _SubjectDetailsDialog extends StatelessWidget {
  final Subject subject;

  const _SubjectDetailsDialog({required this.subject});

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
          child: const Text('シラバス'),
          onPressed: () {
            launchUrl(
              Uri.parse(subject.url),
              mode: LaunchMode.inAppBrowserView,
            );
          },
        ),
        TextButton(
          child: const Text('閉じる'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

int _paletteIndexFromSubjectId(String id) =>
    Uint8List.fromList(sha256.convert(utf8.encode(id)).bytes)
        .buffer
        .asByteData()
        .getUint32(0, Endian.little) %
    _palette.length;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../providers/timetable.dart';
import '../main.dart';

class MiscPage extends ConsumerWidget {
  const MiscPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('その他'),
        centerTitle: false,
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: <ListTile>[
            ListTile(
              title: const Text('時間割をリセット'),
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text("時間割をリセットしますか?"),
                      actions: <TextButton>[
                        TextButton(
                          child: const Text("いいえ"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text("はい"),
                          onPressed: () {
                            _resetTimetable(context, ref);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: const Text('このアプリについて'),
              onTap: () async {
                PackageInfo packageInfo = await PackageInfo.fromPlatform();
                showAboutDialog(
                  context: context,
                  applicationVersion: packageInfo.version,
                  applicationLegalese: '\u00a9 2022 rin4046.',
                );
              },
            ),
          ],
        ).toList(),
      ),
    );
  }
}

void _resetTimetable(BuildContext context, WidgetRef ref) async {
  ref.read(timetableProvider.notifier).clear();
  Navigator.of(context).pop();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: const Text("時間割のリセットが完了しました"),
        actions: <TextButton>[
          TextButton(
            child: const Text("閉じる"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

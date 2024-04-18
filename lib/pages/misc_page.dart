import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tutility/widgets/page_scaffold.dart';

import '../providers/timetable.dart';

@RoutePage()
@immutable
class MiscPage extends ConsumerWidget {
  const MiscPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageScaffold(
      title: const Text('その他'),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: <ListTile>[
            ListTile(
              title: const Text('時間割をリセット'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text('時間割をリセットしますか?'),
                      actions: <TextButton>[
                        TextButton(
                          child: const Text('いいえ'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('はい'),
                          onPressed: () {
                            ref.watch(timetableProvider.notifier).set(null);
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
                  applicationIcon: Container(
                    width: 56 - 8,
                    height: 56 - 8,
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: SvgPicture.asset('assets/icon_appbar.svg'),
                  ),
                  applicationLegalese: '\u00a9 2022 eyr1n',
                );
              },
            ),
          ],
        ).toList(),
      ),
    );
  }
}

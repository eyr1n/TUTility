import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tutility/provider/hide_internship.dart';
import 'package:tutility/provider/hide_research.dart';
import 'package:tutility/provider/timetable.dart';
import 'package:tutility/widget/alert_dialog.dart';
import 'package:tutility/widget/confirm_dialog.dart';

@RoutePage()
@immutable
class MiscPage extends ConsumerWidget {
  const MiscPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideResearch = ref.watch(hideResearchNotifierProvider);
    final hideInternship = ref.watch(hideInternshipNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('その他')),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            SwitchListTile(
              title: const Text('卒業研究を非表示'),
              value: hideResearch,
              onChanged: (value) {
                ref.watch(hideResearchNotifierProvider.notifier).set(value);
              },
            ),
            SwitchListTile(
              title: const Text('実務訓練を非表示'),
              value: hideInternship,
              onChanged: (value) {
                ref.watch(hideInternshipNotifierProvider.notifier).set(value);
              },
            ),
            ListTile(
              title: const Text('時間割をリセット'),
              onTap: () {
                showConfirmDialog(
                  context: context,
                  message: '時間割をリセットしますか?',
                  onOk: () {
                    ref.watch(timetableNotifierProvider.notifier).set(null);
                    showAlertDialog(
                      context: context,
                      message: '時間割のリセットが完了しました',
                    );
                  },
                );
              },
            ),
            ListTile(
              title: const Text('このアプリについて'),
              onTap: () async {
                PackageInfo packageInfo = await PackageInfo.fromPlatform();
                if (context.mounted) {
                  showAboutDialog(
                    context: context,
                    applicationVersion: packageInfo.version,
                    applicationLegalese: '\u00a9 2022 eyr1n',
                  );
                }
              },
            ),
          ],
        ).toList(),
      ),
    );
  }
}

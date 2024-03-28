import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutility/totp.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../providers/timetable.dart';
import '../providers/timetable_visibility.dart';

class GetTimetablePage extends ConsumerWidget {
  GetTimetablePage({super.key});

  final WebViewController _controller = WebViewController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      (Connectivity().checkConnectivity()).then((value) {
        if (value.contains(ConnectivityResult.none)) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: const Text('ネットワークに接続されていません'),
                actions: <TextButton>[
                  TextButton(
                    child: const Text('閉じる'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      });
    });

    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) async {
            if (url ==
                'https://kyomu.office.tut.ac.jp/portal/StudentApp/Blank.aspx#regist_results') {
              await _controller.runJavaScript(
                  'document.querySelector("#ctl00_bhHeader_ctl30_lnk").click()');
            }

            if (url ==
                'https://kyomu.office.tut.ac.jp/portal/StudentApp/Top.aspx') {
              if (context.mounted) {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: Colors.black.withOpacity(0.5),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              await _controller.runJavaScript(
                  'document.querySelector("#ctl00_bhHeader_ctl16_lnk").click()');
            }

            if (url ==
                'https://kyomu.office.tut.ac.jp/portal/StudentApp/Blank.aspx#regist_results') {
              await _controller.runJavaScript(
                  'document.querySelector("#ctl00_bhHeader_ctl30_lnk").click()');
            }

            if (url ==
                'https://kyomu.office.tut.ac.jp/portal/StudentApp/Regist/RegistList.aspx') {
              await _controller.runJavaScript(
                  await rootBundle.loadString('assets/get_timetable.js'));
            }
          },
        ),
      )
      ..addJavaScriptChannel(
        'GetTimetable',
        onMessageReceived: (JavaScriptMessage message) {
          _updateTimetable(context, ref, message);
        },
      )
      ..loadRequest(Uri.parse('https://kyomu.office.tut.ac.jp/portal/'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('時間割の取得'),
        centerTitle: false,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

// JavaScriptから受け取ったJSONを加工・保存
Future<void> _updateTimetable(
    BuildContext context, WidgetRef ref, JavaScriptMessage message) async {
  final Map<String, dynamic> decoded = jsonDecode(message.message);

  // シラバスのJSONを取得
  final allSyllabusesJson = await http.get(Uri.parse(
      'https://syllabus.rinrin.me/ja/${decoded["year"]}/all.min.json'));
  if (allSyllabusesJson.statusCode != 200) {
    return;
  }
  final Map<String, dynamic> allSyllabuses = jsonDecode(allSyllabusesJson.body);

  final List<List<List<Subject>>> timetableList = (decoded["timetable"] as List)
      .map((row) => (row as List)
          .map(
            (col) => (col as List)
                .map((id) => Subject.fromJson({"id": id, ...allSyllabuses[id]}))
                .toList(),
          )
          .toList())
      .toList();
  final List<List<int?>> visibilityList = timetableList
      .map((e) => e.map((e) => e.isNotEmpty ? 0 : null).toList())
      .toList();

  await ref.read(timetableProvider.notifier).update(
      Timetable(list: timetableList, lastUpdated: DateTime.now().toUtc()));
  await ref
      .read(timetableVisibilityProvider.notifier)
      .update(TimetableVisibility(list: visibilityList));

  Navigator.of(context).pop();
  Navigator.of(context).pop();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: const Text('時間割の取得が完了しました\n\nタイルの長押しで「科目」の切り替えや「非表示」ができます'),
        actions: <TextButton>[
          TextButton(
            child: const Text('閉じる'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutility/scope_functions.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../providers/timetable.dart';

@RoutePage()
class GetTimetablePage extends ConsumerWidget {
  GetTimetablePage({super.key});

  final WebViewController _controller = WebViewController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* WidgetsBinding.instance.addPostFrameCallback((_) {
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
    }); */

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
              final String json =
                  await _controller.runJavaScriptReturningResult(
                      'JSON.stringify(getTimetable())') as String;

              final Map<String, dynamic> decoded = jsonDecode(json);
              final timetable = Timetable.fromJson({"list": decoded["normal"]});
              final timetable_ = await _getHalfTimetable(timetable, "2024", 0);

              await ref.watch(timetableProvider.notifier).set(timetable_);

              Navigator.of(context).pop();

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: const Text('時間割の取得が完了しました'),
                    actions: <TextButton>[
                      TextButton(
                        child: const Text('閉じる'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.router.pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
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

Future<Timetable2> _getHalfTimetable(
    Timetable timetable, String year, int period) async {
  final allSyllabusesJson = await http
      .get(Uri.parse('https://syllabus.rinrin.me/ja/$year/all.min.json'));
  if (allSyllabusesJson.statusCode != 200) {
    throw Exception();
  }
  final Map<String, dynamic> allSyllabuses = jsonDecode(allSyllabusesJson.body);

  final replaced = timetable.list.map((row) => row.map((col) => col.map(
      (subject) => allSyllabuses.containsKey(subject.id)
          ? Subject.fromJson(allSyllabuses[subject.id])
          : subject)));

  return Timetable2(
    period: period,
    firstOrSecond: 0,
    firstHalf: replaced
        .map((row) => row
            .map((col) => col
                .where((subject) =>
                    subject.term?.let((term) => period == 0
                        ? (!term.contains("前期2") || !term.contains("前2"))
                        : (!term.contains("後期2") || !term.contains("後2"))) ??
                    true)
                .firstOrNull)
            .toList())
        .toList(),
    secondHalf: replaced
        .map((row) => row
            .map((col) => col
                .where((subject) =>
                    subject.term?.let((term) => period == 0
                        ? (!term.contains("前期1") || !term.contains("前1"))
                        : (!term.contains("後期1") || !term.contains("後1"))) ??
                    true)
                .firstOrNull)
            .toList())
        .toList(),
  );
}

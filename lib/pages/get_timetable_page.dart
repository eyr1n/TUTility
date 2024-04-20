import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tutility/dialog.dart';
import 'package:tutility/providers/timetable.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
@immutable
class GetTimetablePage extends ConsumerWidget {
  final WebViewController _controller = WebViewController();

  GetTimetablePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) async {
            try {
              if (url ==
                  'https://kyomu.office.tut.ac.jp/portal/StudentApp/Top.aspx') {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: Colors.black.withOpacity(0.5),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const Center(child: CircularProgressIndicator()),
                );
                await _controller.runJavaScript(
                    'document.querySelector("#ctl00_bhHeader_ctl16_lnk").click();');
                return;
              }

              if (url ==
                  'https://kyomu.office.tut.ac.jp/portal/StudentApp/Blank.aspx#regist_results') {
                await _controller.runJavaScript(
                    'document.querySelector("#ctl00_bhHeader_ctl30_lnk").click();');
                return;
              }

              if (url ==
                  'https://kyomu.office.tut.ac.jp/portal/StudentApp/Regist/RegistList.aspx') {
                await _controller.runJavaScript(
                    await rootBundle.loadString('assets/get_timetable.js'));
                await _controller.runJavaScript(
                    'GetTimetable.postMessage(JSON.stringify(getTimetable()));');
                return;
              }
            } catch (_) {
              _errorHandler(context);
            }
          },
        ),
      )
      ..addJavaScriptChannel(
        'GetTimetable',
        onMessageReceived: (JavaScriptMessage message) async {
          try {
            final timetableFromJs =
                TimetableFromJs.fromJson(jsonDecode(message.message));
            final timetable =
                await _getHalfTimetable(timetableFromJs, '2024', 0);
            await ref.watch(timetableProvider.notifier).set(timetable);

            if (context.mounted) {
              Navigator.of(context).pop();
              AutoRouter.of(context).popForced();
              showAlertDialog(
                context: context,
                message: '時間割の取得が完了しました',
              );
            }
          } catch (_) {
            if (context.mounted) {
              _errorHandler(context);
            }
          }
        },
      )
      ..loadRequest(Uri.parse('https://kyomu.office.tut.ac.jp/portal/'));

    return Scaffold(
      appBar: AppBar(title: const Text('時間割の取得')),
      body: WebViewWidget(controller: _controller),
    );
  }
}

Future<Timetable> _getHalfTimetable(
    TimetableFromJs timetable, String year, int period) async {
  final allSyllabusesJson = await http
      .get(Uri.parse('https://syllabus.rinrin.me/ja/$year/all.min.json'));
  if (allSyllabusesJson.statusCode != 200) {
    throw Exception();
  }
  final Map<String, dynamic> allSyllabuses = jsonDecode(allSyllabusesJson.body);

  final replaced = timetable.normal.map((row) => row.map((col) => col.map(
      (subject) => allSyllabuses.containsKey(subject.id)
          ? Subject.fromJson(allSyllabuses[subject.id])
          : subject)));

  return Timetable(
    period: period,
    firstOrSecond: 0,
    firstHalf: replaced
        .map((row) => row
            .map((col) => col.where((subject) {
                  final term = subject.term;
                  return term != null
                      ? (period == 0
                          ? (!term.contains('前期2') || !term.contains('前2'))
                          : (!term.contains('後期2') || !term.contains('後2')))
                      : true;
                }).firstOrNull)
            .toList()
            .sublist(0, 5))
        .toList()
        .sublist(0, 6),
    secondHalf: replaced
        .map((row) => row
            .map((col) => col.where((subject) {
                  final term = subject.term;
                  return term != null
                      ? (period == 0
                          ? (!term.contains('前期1') || !term.contains('前1'))
                          : (!term.contains('後期1') || !term.contains('後1')))
                      : true;
                }).firstOrNull)
            .toList()
            .sublist(0, 5))
        .toList()
        .sublist(0, 6),
  );
}

void _errorHandler(BuildContext context) {
  Navigator.of(context).pop();
  AutoRouter.of(context).popForced();
  showAlertDialog(
    context: context,
    message: '時間割の取得時にエラーが発生しました',
  );
}

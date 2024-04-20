import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:tutility/model/subject.dart';
import 'package:tutility/model/timetable.dart';
import 'package:tutility/provider/timetable.dart';
import 'package:tutility/widget/alert_dialog.dart';
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
            final timetable = Timetable.fromJson(jsonDecode(message.message));
            final replaced = await _replaceWithSyllabus(timetable);
            await ref.watch(timetableNotifierProvider.notifier).set(replaced);

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

Future<Timetable> _replaceWithSyllabus(Timetable timetable) async {
  try {
    final syllabusJson = await http.get(Uri.parse(
        'https://syllabus.rinrin.me/ja/${timetable.year}/all.min.json'));
    final syllabus = jsonDecode(syllabusJson.body);

    List<List<Subject?>> replace(List<List<Subject?>> timetable) => timetable
        .map((row) => row
            .map((subject) => subject != null
                ? (syllabus.containsKey(subject.id)
                    ? Subject.fromJson(syllabus[subject.id])
                    : subject)
                : null)
            .toList())
        .toList();

    return timetable.copyWith(
      firstHalf: replace(timetable.firstHalf),
      secondHalf: replace(timetable.secondHalf),
      intensive: replace(timetable.firstHalf),
    );
  } catch (_) {
    return timetable;
  }
}

void _errorHandler(BuildContext context) {
  Navigator.of(context).pop();
  AutoRouter.of(context).popForced();
  showAlertDialog(
    context: context,
    message: '時間割の取得時にエラーが発生しました',
  );
}

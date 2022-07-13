import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../utils/tile_data.dart';

class GetTimetablePage extends StatelessWidget {
  GetTimetablePage({Key? key, required this.sink}) : super(key: key);

  final StreamSink<Tuple2<String, String>> sink;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('時間割の取得'),
        centerTitle: false,
      ),
      body: WebView(
        initialUrl: 'https://kyomu.office.tut.ac.jp/portal/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _controller.complete(controller);
        },
        onPageFinished: (url) {
          _operateWebView(context, _controller, url);
        },
        javascriptChannels: {
          JavascriptChannel(
            name: 'GetTimetable',
            onMessageReceived: (message) {
              _getTimetableJson(context, message, sink);
            },
          )
        },
      ),
    );
  }
}

// WebViewの自動操作
void _operateWebView(BuildContext context,
    Completer<WebViewController> completer, String url) async {
  final controller = await completer.future;

  if (url == 'https://kyomu.office.tut.ac.jp/portal/StudentApp/Top.aspx') {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, animation, secondaryAnimation) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    controller.runJavascript(
        'document.querySelector("#ctl00_bhHeader_ctl16_lnk").click()');
  }

  if (url ==
      'https://kyomu.office.tut.ac.jp/portal/StudentApp/Blank.aspx#regist_results') {
    controller.runJavascript(
        'document.querySelector("#ctl00_bhHeader_ctl30_lnk").click()');
  }

  if (url ==
      'https://kyomu.office.tut.ac.jp/portal/StudentApp/Regist/RegistList.aspx') {
    await controller
        .runJavascript(await rootBundle.loadString('assets/get_timetable.js'));
  }
}

// JavaScriptから受け取ったJSONを加工・保存
void _getTimetableJson(BuildContext context, JavascriptMessage message,
    StreamSink<Tuple2<String, String>> sink) async {
  List<String> day = ['月', '火', '水', '木', '金'];

  List<dynamic> json = jsonDecode(message.message);

  List<List<TileData?>> tiles = [];

  for (int i = 0; i < 6; i++) {
    List<TileData?> tmp = [];
    for (int j = 0; j < 5; j++) {
      if (json[i][j].length > 1) {
        int idx = 0;
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return SimpleDialog(
              title: Text('${day[j]}曜 ${i + 1}限 の授業を選択'),
              children: json[i][j].asMap().entries.map<Widget>((item) {
                return SimpleDialogOption(
                  onPressed: () {
                    idx = item.key;
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    '${item.value['name']} (${item.value['staff']})',
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
            );
          },
        );
        tmp.add(TileData.fromJson(json[i][j][idx]));
      } else if (json[i][j].length == 1) {
        tmp.add(TileData.fromJson(json[i][j][0]));
      } else {
        tmp.add(null);
      }
    }
    tiles.add(tmp);
  }

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('timetable_json', jsonEncode(tiles));
  prefs.setString(
      'timetable_get_date', DateTime.now().toUtc().toIso8601String());

  sink.add(Tuple2(jsonEncode(tiles), DateTime.now().toUtc().toIso8601String()));

  Navigator.of(context).pop();
  Navigator.of(context).pop();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: const Text("時間割の取得が完了しました"),
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

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@immutable
class CanteenPage extends StatelessWidget {
  const CanteenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      (Connectivity().checkConnectivity()).then((value) {
        if (value == ConnectivityResult.none) {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('食堂メニュー'),
        centerTitle: false,
      ),
      body: const WebView(
        initialUrl: 'https://tut-canteen-menu.rinrin.me/inapp',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

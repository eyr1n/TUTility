import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@immutable
class CanteenPage extends StatelessWidget {
  const CanteenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..loadRequest(Uri.parse('https://tut-canteen-menu.rinrin.me/inapp'));

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('食堂メニュー'),
        centerTitle: false,
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}

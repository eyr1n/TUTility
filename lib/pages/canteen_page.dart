import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@immutable
class CanteenPage extends StatelessWidget {
  const CanteenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

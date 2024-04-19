import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
@immutable
class CanteenPage extends StatelessWidget {
  const CanteenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..loadRequest(Uri.parse('https://tut-canteen-menu.rinrin.me/inapp'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('食堂メニュー'),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

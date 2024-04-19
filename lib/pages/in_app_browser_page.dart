import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
@immutable
class InAppBrowserPage extends HookWidget {
  final Uri uri;

  const InAppBrowserPage({super.key, required this.uri});

  @override
  Widget build(BuildContext context) {
    final progressState = useState(0);
    final loadingState = useState(false);
    final urlState = useState("");

    final controller = useMemoized(() {
      final controller = WebViewController();
      return controller
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(NavigationDelegate(
          onProgress: (progress) {
            progressState.value = progress;
          },
          onPageStarted: (url) {
            loadingState.value = true;
            urlState.value = url;
          },
          onPageFinished: (url) {
            loadingState.value = false;
          },
        ))
        ..loadRequest(uri);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(urlState.value),
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_browser),
            tooltip: 'ブラウザで開く',
            onPressed: () async {
              await launchUrl(
                Uri.parse(urlState.value),
                mode: LaunchMode.externalApplication,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: '再読み込み',
            onPressed: () async {
              await controller.reload();
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: loadingState.value
              ? LinearProgressIndicator(
                  value: progressState.value / 100,
                  minHeight: 4.0,
                )
              : const SizedBox.shrink(),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}

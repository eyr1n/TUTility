import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutility/totp.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

final _urlProvider = StateProvider<String>((ref) => '');
final _progressProvider = StateProvider<int>((ref) => 0);
final _loadingProvider = StateProvider<bool>((ref) => false);

@immutable
class AutoLogin extends ConsumerWidget {
  final WebViewController controller;

  const AutoLogin({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(_progressProvider);
    final loading = ref.watch(_loadingProvider);
    final url = ref.watch(_urlProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(url),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_browser),
            tooltip: 'ブラウザで開く',
            onPressed: () async {
              await launchUrl(Uri.parse(url));
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
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          loading
              ? LinearProgressIndicator(
                  value: progress / 100,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

@immutable
class InAppBrowser extends ConsumerWidget {
  final Uri uri;
  final WebViewController controller = WebViewController();

  final username = "hogehoge";
  final password = "hogehoge";
  final totpkey = "hogehoge";

  InAppBrowser({super.key, required this.uri});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            ref.read(_progressProvider.notifier).state = progress;
          },
          onPageStarted: (url) {
            ref.read(_loadingProvider.notifier).state = true;
            ref.read(_urlProvider.notifier).state = url;
          },
          onPageFinished: (url) async {
            ref.read(_loadingProvider.notifier).state = false;
            if (url.startsWith(
                "https://idp.imc.tut.ac.jp/idp/profile/SAML2/Redirect/SSO")) {
              await controller.runJavaScript('''
                  const totpBtn = document.querySelector("button[name=_eventId_ChooseExternal]");
                  if (totpBtn) {
                    totpBtn.click();
                  } else {
                    document.querySelector("input[name=j_username]").value = "$username";
                    document.querySelector("input[name=j_password]").value = "$password";
                    document.querySelector("button[name=_eventId_proceed]").click();
                  }
                  ''');
            }
            if (url
                .startsWith("https://idp.imc.tut.ac.jp/idp/Authn/External")) {
              await controller.runJavaScript('''
                  document.querySelector("input[name=candr]").value = "${totp(totpkey, DateTime.now())}";
                  document.querySelector("button[name=login]").click();
                  ''');
            }
            if (url ==
                "https://lms.imc.tut.ac.jp/auth/tutimc_shibboleth/index.php") {
              await controller.runJavaScript('''
                  document.querySelector("input[name=pattern]").value = "豊橋技術科学大学";
                  const loginBtn = document.querySelector("input[name=Login]");
                  loginBtn.disabled = false;
                  loginBtn.click();
                  ''');
            }
          },
        ),
      )
      ..loadRequest(uri);

    return AutoLogin(
      controller: controller,
    );
  }
}

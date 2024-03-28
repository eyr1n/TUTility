import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:tutility/pages/in_app_browser.dart';

@immutable
class _LinkItem {
  final String name;
  final String url;

  const _LinkItem({required this.name, required this.url});
}

const List<_LinkItem> _links = [
  _LinkItem(name: '大学ホームページ', url: 'https://www.tut.ac.jp/'),
  _LinkItem(name: '教務情報システム', url: 'https://kyomu.office.tut.ac.jp/portal/'),
  _LinkItem(
      name: '休講情報・案内',
      url: 'https://kyomu.office.tut.ac.jp/portal/Public/Board/BoardList.aspx'),
  _LinkItem(name: 'TUT LMS', url: 'https://lms.imc.tut.ac.jp/login/index.php'),
  _LinkItem(
      name: "バス時刻表 (技科大前)", url: "https://www.toyotetsu.jp/station/82/P2/"),
  _LinkItem(name: "バス時刻表 (豊橋駅前)", url: "https://www.toyotetsu.jp/station/1/P2/")
];

class LinksPage extends StatelessWidget {
  const LinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リンク'),
        centerTitle: false,
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: _links
              .map(
                (item) => ListTile(
                  title: Text(item.name),
                  onTap: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            InAppBrowser(uri: Uri.parse(item.url)),
                        fullscreenDialog: true,
                      ),
                    );
                    /*  await launchUrl(
                      Uri.parse(item.url),
                      customTabsOptions: const CustomTabsOptions(),
                      safariVCOptions: const SafariViewControllerOptions(),
                    ); */
                  },
                ),
              )
              .toList(),
        ).toList(),
      ),
    );
  }
}

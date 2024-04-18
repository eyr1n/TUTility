import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tutility/pages/in_app_browser_page.dart';
import 'package:tutility/widgets/page_scaffold.dart';

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

@RoutePage()
class LinksPage extends StatelessWidget {
  const LinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: const Text('リンク'),
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
                            InAppBrowserPage(uri: Uri.parse(item.url)),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                ),
              )
              .toList(),
        ).toList(),
      ),
    );
  }
}

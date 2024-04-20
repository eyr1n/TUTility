import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
@immutable
class LinksPage extends StatelessWidget {
  const LinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リンク'),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: _links
              .map(
                (item) => ListTile(
                  title: Text(item.title),
                  onTap: () {
                    launchUrl(
                      Uri.parse(item.url),
                      mode: LaunchMode.inAppBrowserView,
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

@immutable
class _Link {
  final String title;
  final String url;

  const _Link({required this.title, required this.url});
}

const List<_Link> _links = [
  _Link(title: '大学ホームページ', url: 'https://www.tut.ac.jp/'),
  _Link(title: '教務情報システム', url: 'https://kyomu.office.tut.ac.jp/portal/'),
  _Link(
      title: '休講情報・案内',
      url: 'https://kyomu.office.tut.ac.jp/portal/Public/Board/BoardList.aspx'),
  _Link(title: 'TUT LMS', url: 'https://lms.imc.tut.ac.jp/login/index.php'),
  _Link(
      title: 'キャンパスマップ',
      url: 'https://www.tut.ac.jp/about/overview/docs/202310map.pdf'),
  _Link(title: 'バス時刻表 (技科大前)', url: 'https://www.toyotetsu.jp/station/82/P2/'),
  _Link(title: 'バス時刻表 (豊橋駅前)', url: 'https://www.toyotetsu.jp/station/1/P2/')
];

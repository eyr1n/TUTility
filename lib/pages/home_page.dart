import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutility/providers/timetable.dart';
import 'package:tutility/router/app_router.dart';
import 'package:tutility/scope_functions.dart';
import 'package:tutility/widgets/split_view.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timetable = ref.watch(timetableProvider);

    return SplitView(
      menu: ListView(
        children: [
          const DrawerHeader(
            child: Text(
              'TUTility',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const NavLink(
            icon: Icons.calendar_month,
            label: '時間割',
            destination: TimetableRoute(),
          ),
          const NavLink(
            icon: Icons.restaurant,
            label: '食堂',
            destination: CanteenRoute(),
          ),
          const NavLink(
            icon: Icons.language,
            label: 'リンク',
            destination: LinksRoute(),
          ),
          const NavLink(
            icon: Icons.more_horiz,
            label: 'その他',
            destination: MiscRoute(),
          ),
          const Divider(),
          MyListTile(
            title: const Text('時間割の取得'),
            leading: const Icon(Icons.download),
            onTap: () {
              context.pushRoute(GetTimetableRoute());
            },
          ),
          if (timetable != null)
            MyListTile(
              title: Text(
                  '${timetable.period == 0 ? "前期" : "後期"}${timetable.firstOrSecond == 0 ? 2 : 1} に切り替え'),
              leading: const Icon(Icons.swap_horiz),
              onTap: () async {
                await ref.watch(timetableProvider.notifier).set(
                    timetable.copyWith(
                        firstOrSecond: timetable.firstOrSecond == 0 ? 1 : 0));
              },
            ),
        ],
      ),
      content: const AutoRouter(),
    );
  }
}

@immutable
class MyListTile extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  final void Function() onTap;

  const MyListTile({
    super.key,
    required this.title,
    this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      leading: leading,
      onTap: () {
        onTap();
        if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}

@immutable
class NavLink extends StatelessWidget {
  final String label;
  final IconData icon;
  final PageRouteInfo destination;

  const NavLink({
    super.key,
    required this.label,
    required this.icon,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      leading: Icon(icon),
      onTap: () {
        context.router.replace(destination);
        if (Scaffold.maybeOf(context)?.hasDrawer ?? false) {
          Navigator.maybeOf(context)?.pop();
        }
      },
    );
  }
}

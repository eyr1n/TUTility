import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tutility/router/app_router.dart';

List<_Destination> _destinations = [
  const _Destination(
    icon: Icon(Icons.calendar_month),
    label: '時間割',
    route: TimetableRoute(),
  ),
  _Destination(
    icon: const Icon(Icons.restaurant),
    label: '食堂',
    route: CanteenRoute(),
  ),
  const _Destination(
    icon: Icon(Icons.language),
    label: 'リンク',
    route: LinksRoute(),
  ),
  const _Destination(
    icon: Icon(Icons.more_horiz),
    label: 'その他',
    route: MiscRoute(),
  ),
];

@RoutePage()
@immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: _destinations.map((destination) => destination.route).toList(),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return switch (MediaQuery.of(context).orientation) {
          Orientation.portrait => Scaffold(
              body: child,
              bottomNavigationBar: NavigationBar(
                selectedIndex: tabsRouter.activeIndex,
                onDestinationSelected: tabsRouter.setActiveIndex,
                destinations: _destinations
                    .map((destination) => NavigationDestination(
                          icon: destination.icon,
                          label: destination.label,
                        ))
                    .toList(),
              ),
            ),
          Orientation.landscape => Scaffold(
              body: Row(
                children: [
                  NavigationDrawer(
                    selectedIndex: tabsRouter.activeIndex,
                    onDestinationSelected: tabsRouter.setActiveIndex,
                    elevation: 0,
                    children: [
                      const SizedBox(height: 12),
                      ..._destinations
                          .map((destination) => NavigationDrawerDestination(
                                icon: destination.icon,
                                label: Text(destination.label),
                              )),
                    ],
                  ),
                  const VerticalDivider(thickness: 1, width: 1),
                  Expanded(child: child),
                ],
              ),
            ),
        };
      },
    );
  }
}

@immutable
class _Destination {
  final Icon icon;
  final String label;
  final PageRouteInfo route;

  const _Destination({
    required this.icon,
    required this.label,
    required this.route,
  });
}

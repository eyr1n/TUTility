import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tutility/page/canteen_page.dart';
import 'package:tutility/page/get_timetable_page.dart';
import 'package:tutility/page/home_page.dart';
import 'package:tutility/page/links_page.dart';
import 'package:tutility/page/misc_page.dart';
import 'package:tutility/page/timetable_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: NavigationRoute.page,
          initial: true,
          children: [
            AutoRoute(page: TimetableRoute.page, initial: true),
            AutoRoute(page: CanteenRoute.page),
            AutoRoute(page: LinksRoute.page),
            AutoRoute(page: MiscRoute.page),
          ],
        ),
        AutoRoute(page: GetTimetableRoute.page, fullscreenDialog: true),
      ];
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:tutility/pages/get_timetable_page.dart';
import 'package:tutility/pages/in_app_browser_page.dart';
import 'package:tutility/pages/links_page.dart';
import 'package:tutility/pages/misc_page.dart';
import 'package:tutility/pages/timetable_page.dart';

import '../pages/home_page.dart';
import '../pages/canteen_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          children: [
            AutoRoute(page: TimetableRoute.page, initial: true),
            AutoRoute(page: CanteenRoute.page),
            AutoRoute(page: LinksRoute.page),
            AutoRoute(page: MiscRoute.page),
          ],
        ),
        AutoRoute(page: GetTimetableRoute.page, fullscreenDialog: true),
        AutoRoute(page: InAppBrowserRoute.page, fullscreenDialog: true),
      ];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CanteenRoute.name: (routeData) {
      final args = routeData.argsAs<CanteenRouteArgs>(
          orElse: () => const CanteenRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CanteenPage(key: args.key),
      );
    },
    GetTimetableRoute.name: (routeData) {
      final args = routeData.argsAs<GetTimetableRouteArgs>(
          orElse: () => const GetTimetableRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GetTimetablePage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LinksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LinksPage(),
      );
    },
    MiscRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MiscPage(),
      );
    },
    TimetableRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TimetablePage(),
      );
    },
  };
}

/// generated route for
/// [CanteenPage]
class CanteenRoute extends PageRouteInfo<CanteenRouteArgs> {
  CanteenRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CanteenRoute.name,
          args: CanteenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CanteenRoute';

  static const PageInfo<CanteenRouteArgs> page =
      PageInfo<CanteenRouteArgs>(name);
}

class CanteenRouteArgs {
  const CanteenRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CanteenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [GetTimetablePage]
class GetTimetableRoute extends PageRouteInfo<GetTimetableRouteArgs> {
  GetTimetableRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          GetTimetableRoute.name,
          args: GetTimetableRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'GetTimetableRoute';

  static const PageInfo<GetTimetableRouteArgs> page =
      PageInfo<GetTimetableRouteArgs>(name);
}

class GetTimetableRouteArgs {
  const GetTimetableRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'GetTimetableRouteArgs{key: $key}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LinksPage]
class LinksRoute extends PageRouteInfo<void> {
  const LinksRoute({List<PageRouteInfo>? children})
      : super(
          LinksRoute.name,
          initialChildren: children,
        );

  static const String name = 'LinksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MiscPage]
class MiscRoute extends PageRouteInfo<void> {
  const MiscRoute({List<PageRouteInfo>? children})
      : super(
          MiscRoute.name,
          initialChildren: children,
        );

  static const String name = 'MiscRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TimetablePage]
class TimetableRoute extends PageRouteInfo<void> {
  const TimetableRoute({List<PageRouteInfo>? children})
      : super(
          TimetableRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimetableRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

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
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CanteenPage(),
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
    InAppBrowserRoute.name: (routeData) {
      final args = routeData.argsAs<InAppBrowserRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: InAppBrowserPage(
          key: args.key,
          uri: args.uri,
        ),
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
class CanteenRoute extends PageRouteInfo<void> {
  const CanteenRoute({List<PageRouteInfo>? children})
      : super(
          CanteenRoute.name,
          initialChildren: children,
        );

  static const String name = 'CanteenRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [InAppBrowserPage]
class InAppBrowserRoute extends PageRouteInfo<InAppBrowserRouteArgs> {
  InAppBrowserRoute({
    Key? key,
    required Uri uri,
    List<PageRouteInfo>? children,
  }) : super(
          InAppBrowserRoute.name,
          args: InAppBrowserRouteArgs(
            key: key,
            uri: uri,
          ),
          initialChildren: children,
        );

  static const String name = 'InAppBrowserRoute';

  static const PageInfo<InAppBrowserRouteArgs> page =
      PageInfo<InAppBrowserRouteArgs>(name);
}

class InAppBrowserRouteArgs {
  const InAppBrowserRouteArgs({
    this.key,
    required this.uri,
  });

  final Key? key;

  final Uri uri;

  @override
  String toString() {
    return 'InAppBrowserRouteArgs{key: $key, uri: $uri}';
  }
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutility/providers/timetable.dart';

import 'providers/timetable_visibility.dart';
import 'widgets/navbar.dart';

import 'package:tuple/tuple.dart';

import 'pages/timetable_page.dart';
import 'pages/links_page.dart';
import 'pages/misc_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 設定取得
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? timetableJson = prefs.getString("tutility_timetable");
  String? timetableVisibilityJson =
      prefs.getString("tutility_timetable_visibility");

  Timetable? timetable;
  TimetableVisibility? visibility;

  try {
    timetable = Timetable.fromJson(jsonDecode(timetableJson!));
    visibility =
        TimetableVisibility.fromJson(jsonDecode(timetableVisibilityJson!));
  } catch (_) {
    timetable = null;
    visibility = null;
  }

  timetableProvider = StateNotifierProvider<TimetableNotifier, Timetable?>(
      (ref) => TimetableNotifier(timetable));
  timetableVisibilityProvider =
      StateNotifierProvider<TimetableVisibilityNotifier, TimetableVisibility?>(
          (ref) => TimetableVisibilityNotifier(visibility));

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: TUTilityApp()));
}

class TUTilityApp extends StatelessWidget {
  const TUTilityApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TUTility',
      // debugShowCheckedModeBanner: false,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('ja')],
      locale: const Locale('ja'),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red,
        brightness: Brightness.dark,
      ),
      home: TUTilityNavBar(items: [
        Tuple2(
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: '時間割',
          ),
          TimetablePage(),
        ),
        Tuple2(
          NavigationDestination(
            icon: Icon(Icons.language),
            label: 'リンク',
          ),
          LinksPage(),
        ),
        Tuple2(
          NavigationDestination(
            icon: Icon(Icons.more_horiz),
            label: 'その他',
          ),
          MiscPage(),
        ),
      ]),
    );
  }
}

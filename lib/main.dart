import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutility/providers/timetable.dart';

import './providers/timetable_visibility.dart';
import './navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // 設定取得
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? timetableJson = prefs.getString("tutility_timetable");
  String? timetableVisibilityJson =
      prefs.getString("tutility_timetable_visibility");

  Timetable? timetable;
  TimetableVisibility? visibility;

  // JSONのデコードに失敗したらnullでも入れとく
  try {
    timetable = Timetable.fromJson(jsonDecode(timetableJson!));
    visibility =
        TimetableVisibility.fromJson(jsonDecode(timetableVisibilityJson!));
  } catch (_) {
    timetable = null;
    visibility = null;
  }

  // Providerの初期化
  timetableProvider = StateNotifierProvider<TimetableNotifier, Timetable?>(
      (ref) => TimetableNotifier(timetable));
  timetableVisibilityProvider =
      StateNotifierProvider<TimetableVisibilityNotifier, TimetableVisibility?>(
          (ref) => TimetableVisibilityNotifier(visibility));

  runApp(const ProviderScope(child: TUTilityApp()));
}

class TUTilityApp extends StatelessWidget {
  const TUTilityApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TUTility',
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
      home: const TUTilityNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

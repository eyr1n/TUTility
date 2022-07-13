import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:tutility/pages/cafe_menu.dart';

import 'widgets/navbar.dart';

import 'package:tuple/tuple.dart';

import '../pages/timetable.dart';
import '../pages/links.dart';
import '../pages/misc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const TUTilityApp());
}

class TUTilityApp extends StatelessWidget {
  const TUTilityApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TUTility',
      debugShowCheckedModeBanner: false,
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
      //themeMode: ThemeMode.system,
      home: const TUTilityNavBar(items: [
        Tuple2(
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: '時間割',
          ),
          TimetablePage(),
        ),
        Tuple2(
          NavigationDestination(
            icon: Icon(Icons.restaurant),
            label: '食堂',
          ),
          CafeMenu(),
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

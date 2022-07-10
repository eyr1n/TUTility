import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';

import 'widgets/navbar.dart';

import 'package:tuple/tuple.dart';

import '../pages/timetable.dart';
import '../pages/links.dart';
import '../pages/misc.dart';

const MaterialColor tutilityPalette = MaterialColor(0xFFC7000A, <int, Color>{
  50: Color(0xFFF8E0E2),
  100: Color(0xFFEEB3B6),
  200: Color(0xFFE38085),
  300: Color(0xFFD84D54),
  400: Color(0xFFCF262F),
  500: Color(0xFFC7000A),
  600: Color(0xFFC10009),
  700: Color(0xFFBA0007),
  800: Color(0xFFB30005),
  900: Color(0xFFA60003),
});

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
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('ja')],
      locale: const Locale('ja'),
      theme: ThemeData(
        primarySwatch: tutilityPalette,
      ),
      home: const TUTilityNavBar(items: [
        Tuple2(
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: '時間割',
          ),
          TimetablePage(),
        ),
        Tuple2(
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: '食堂',
          ),
          LinksPage(),
        ),
        Tuple2(
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'リンク',
          ),
          LinksPage(),
        ),
        Tuple2(
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'その他',
          ),
          MiscPage(),
        ),
      ]),
      debugShowCheckedModeBanner: false,
    );
  }
}

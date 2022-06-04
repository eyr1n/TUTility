import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';

import 'widgets/bottom_navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TUTility',
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        supportedLocales: const [Locale('ja')],
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const TUTilityAppBar());
  }
}

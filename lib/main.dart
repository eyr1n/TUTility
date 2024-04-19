import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutility/providers/shared_preferences.dart';
import 'package:tutility/router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ProviderScope(
    child: SharedPreferencesScope(
      child: App(),
    ),
  ));
}

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TUTility',
      theme: _themeData(Brightness.light),
      darkTheme: _themeData(Brightness.dark),
      locale: const Locale('ja'),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [Locale('ja')],
      routerConfig: _appRouter.config(),
    );
  }
}

ThemeData _themeData(Brightness brightness) => ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.red,
      appBarTheme: const AppBarTheme(centerTitle: false),
      brightness: brightness,
    );

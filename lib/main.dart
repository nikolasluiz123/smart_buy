import 'package:flutter/material.dart';
import 'package:smart_buy/ui/screens/login/login_page.dart';
import 'package:smart_buy/ui/screens/splash_page.dart';

import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Meu App',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            useMaterial3: true
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          '/login': (context) => const LoginPage(),
        },
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales
    );
  }
}

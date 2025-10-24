import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_buy/ui/screens/login/login_cubit.dart';
import 'package:smart_buy/ui/screens/login/login_page.dart';
import 'package:smart_buy/ui/screens/register_user/register_user_cubit.dart';
import 'package:smart_buy/ui/screens/register_user/register_user_page.dart';
import 'package:smart_buy/ui/screens/splash_page.dart';
import 'package:smart_buy/ui/theme/theme.dart';

import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => BlocProvider(create: (_) => LoginCubit(), child: const LoginPage()),
        '/user/register': (context) => BlocProvider(create: (_) => RegisterUserCubit(), child: const RegisterUserPage()),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

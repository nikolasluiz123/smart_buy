// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginPageTitle => 'Sign In';

  @override
  String get smartBuy => 'Smart Buy';

  @override
  String get welcomeBack => 'Welcome back!';

  @override
  String get signInPrompt => 'Enter your credentials to access your account';

  @override
  String get emailHint => 'Email';

  @override
  String get passwordHint => 'Password';

  @override
  String get loginButton => 'Sign In';

  @override
  String get orDivider => 'or';

  @override
  String get googleButton => 'Continue with Google';

  @override
  String get forgotPassword => 'Forgot your password?';

  @override
  String get noAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign up';

  @override
  String get passwordEmpty => 'Please, write your password';

  @override
  String get weakPassword => 'Password must be at least 6 characters long';

  @override
  String get emailEmpty => 'Please, write your e-mail';

  @override
  String get emailInvalid => 'Please enter a valid email address';

  @override
  String get genericError => 'An unexpected error occurred';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get back => 'Back';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get loginPageTitle => 'Entrar';

  @override
  String get smartBuy => 'Smart Buy';

  @override
  String get welcomeBack => 'Bem-vindo de volta!';

  @override
  String get signInPrompt => 'Digite suas credenciais para acessar sua conta';

  @override
  String get emailHint => 'E-mail';

  @override
  String get passwordHint => 'Senha';

  @override
  String get loginButton => 'Entrar';

  @override
  String get orDivider => 'ou';

  @override
  String get googleButton => 'Continuar com Google';

  @override
  String get forgotPassword => 'Esqueceu sua senha?';

  @override
  String get noAccount => 'Não tem uma conta?';

  @override
  String get signUp => 'Cadastre-se';

  @override
  String get passwordEmpty => 'Por favor, digite sua senha';

  @override
  String get weakPassword => 'A senha deve ter pelo menos 6 caracteres';

  @override
  String get emailEmpty => 'Por favor, digite seu e-mail';

  @override
  String get emailInvalid => 'Por favor, digite um e-mail válido';
}

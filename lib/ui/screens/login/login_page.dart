import 'package:flutter/material.dart';
import 'package:smart_buy/ui/components/google_login_button.dart';
import 'package:smart_buy/ui/screens/login/components/email_field.dart';

import '../../../constants/icons.dart';
import '../../../l10n/app_localizations.dart';
import '../../components/labeled_horizontal_divider.dart';
import '../../theme/colors.dart';
import 'components/login_button.dart';
import 'components/login_card.dart';
import 'components/logo_login.dart';
import 'components/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Chave para o formulário, usada para validação
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos de texto
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // Sempre descarte os controladores quando o widget for removido
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /// Manipulador para o botão "Entrar"
  void _onLoginPressed() {
    // Verifica se o formulário é válido
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // TODO: Chamar seu BLoC/Cubit aqui para processar o login
      // Ex: context.read<LoginBloc>().add(
      //      LoginSubmitted(email: email, password: password),
      //     );
      debugPrint('Login attempt with Email: $email, Password: $password');
    }
  }

  /// Manipulador para o botão "Continuar com Google"
  void _onGoogleLoginPressed() {
    // TODO: Chamar seu BLoC/Cubit aqui para processar o login com Google
    // Ex: context.read<LoginBloc>().add(GoogleLoginSubmitted());
    debugPrint('Google Login attempt');
  }

  /// Manipulador para "Esqueceu sua senha?"
  void _onForgotPasswordPressed() {
    // TODO: Navegar para a tela de "Esqueceu a Senha"
    // Ex: Navigator.of(context).pushNamed('/forgot-password');
    debugPrint('Forgot Password pressed');
  }

  /// Manipulador para "Cadastre-se"
  void _onSignUpPressed() {
    // TODO: Navegar para a tela de "Cadastro"
    // Ex: Navigator.of(context).pushNamed('/signup');
    debugPrint('Sign Up pressed');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LogoLogin(),
                    const SizedBox(height: 32.0),
                    LoginCard(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              l10n.loginButton,
                              style: TextStyle(color: kDarkText, fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              l10n.signInPrompt,
                              style: TextStyle(color: kMediumGrayText, fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 24.0),
                            EmailField(controller: _emailController, icon: iconEmail),
                            const SizedBox(height: 16.0),
                            PasswordField(controller: _passwordController, icon: iconPadLock),
                            const SizedBox(height: 24.0),
                            LoginButton(onLoginPressed: _onLoginPressed),
                            const SizedBox(height: 24.0),
                            LabeledHorizontalDivider(label: l10n.orDivider),
                            const SizedBox(height: 24.0),
                            GoogleLoginButton(label: l10n.googleButton, onGoogleLoginPressed: _onGoogleLoginPressed),
                            const SizedBox(height: 24.0),
                            Column(
                              children: [
                                TextButton(
                                  onPressed: _onForgotPasswordPressed,
                                  child: Text(
                                    l10n.forgotPassword,
                                    style: TextStyle(color: kMediumGrayText, fontSize: 14, fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      l10n.noAccount,
                                      style: TextStyle(color: kMediumGrayText, fontSize: 16, fontWeight: FontWeight.w400),
                                    ),
                                    TextButton(
                                      onPressed: _onSignUpPressed,
                                      child: Text(
                                        l10n.signUp,
                                        style: TextStyle(color: kSignUpLink, fontSize: 14, fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

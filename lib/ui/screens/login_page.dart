import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/icons.dart';
import '../../constants/images.dart';
import '../../l10n/app_localizations.dart';

const Color _kSmartBuyBlue = Color(0xFF5CC1E0);
const Color _kMediumGrayText = Color(0xFF5F6368);
const Color _kDarkText = Color(0xFF1A1A2E);
const Color _kFieldBackground = Color(0xFFEEF1F5);
const Color _kGoogleButtonBg = Color(0xFFF5F7FA);
const Color _kGoogleButtonBorder = Color(0xFFDADCE0);
const Color _kSignUpLink = Color(0xFF355E88);

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTopSection(l10n),
              const SizedBox(height: 32.0),
              _buildLoginFormCard(l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection(AppLocalizations l10n) {
    return Column(
      children: [
        Image.asset(appLogo, width: 140, height: 140),
        Text(
          l10n.smartBuy,
          style: const TextStyle(color: _kSmartBuyBlue, fontSize: 24, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8.0),
        Text(
          l10n.welcomeBack,
          style: const TextStyle(color: _kMediumGrayText, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _buildLoginFormCard(AppLocalizations l10n) {
    return Card(
      elevation: 4.0,
      shadowColor: Colors.black.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      color: Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.loginButton,
                style: TextStyle(color: _kDarkText, fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 8.0),
              Text(
                l10n.signInPrompt,
                style: TextStyle(color: _kMediumGrayText, fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                controller: _emailController,
                decoration: _buildInputDecoration(
                  hint: l10n.emailHint,
                  icon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      iconEmail,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.emailEmpty;
                  }
                  if (!value.contains('@')) {
                    return l10n.emailInvalid;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: _buildInputDecoration(
                  hint: l10n.passwordHint,
                  icon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      iconPadLock,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return l10n.passwordEmpty;
                  }
                  if (value.length < 6) {
                    return l10n.weakPassword;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _onLoginPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _kSmartBuyBlue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                ),
                child: Text(l10n.loginButton, style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 24.0),
              _buildOrDivider(l10n),
              const SizedBox(height: 24.0),
              OutlinedButton(
                onPressed: _onGoogleLoginPressed,
                style: OutlinedButton.styleFrom(
                  backgroundColor: _kGoogleButtonBg,
                  side: const BorderSide(color: _kGoogleButtonBorder),
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      iconGoogle,
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(width: 12.0),
                    Text(
                      l10n.googleButton,
                      style: TextStyle(color: Color(0xFF3F4246), fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              _buildBottomSection(l10n)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection(AppLocalizations l10n) {
    return Column(
      children: [
        TextButton(
          onPressed: _onForgotPasswordPressed,
          child: Text(
            l10n.forgotPassword,
            style: TextStyle(color: _kMediumGrayText, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.noAccount,
              style: TextStyle(color: _kMediumGrayText, fontSize: 16, fontWeight: FontWeight.w400),
            ),
            TextButton(
              onPressed: _onSignUpPressed,
              child: Text(
                l10n.signUp,
                style: TextStyle(color: _kSignUpLink, fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration({required String hint, required Widget icon}) {
    return InputDecoration(
      prefixIcon: icon,
      hintText: hint,
      hintStyle: const TextStyle(color: _kMediumGrayText),
      filled: true,
      fillColor: _kFieldBackground,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: _kSmartBuyBlue),
      ),
    );
  }

  Widget _buildOrDivider(AppLocalizations l10n) {
    return Row(
      children: [
        const Expanded(child: Divider(color: _kGoogleButtonBorder)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(l10n.orDivider, style: TextStyle(color: _kMediumGrayText.withValues(alpha: 0.8), fontSize: 14)),
        ),
        const Expanded(child: Divider(color: _kGoogleButtonBorder)),
      ],
    );
  }
}

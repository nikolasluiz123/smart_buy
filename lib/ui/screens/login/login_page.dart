import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_buy/ui/components/app_error_view.dart';
import 'package:smart_buy/ui/components/app_loading_indicator.dart';
import 'package:smart_buy/ui/components/google_login_button.dart';
import 'package:smart_buy/ui/components/states/page_state.dart';
import 'package:smart_buy/ui/screens/login/components/email_field.dart';

import '../../../constants/icons.dart';
import '../../../l10n/app_localizations.dart';
import '../../components/labeled_horizontal_divider.dart';
import 'components/login_button.dart';
import 'components/login_card.dart';
import 'components/logo_login.dart';
import 'components/password_field.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final l10n = AppLocalizations.of(context)!;
      context.read<LoginCubit>().signIn(email, password, l10n.genericError);
    }
  }

  void _onGoogleLoginPressed() {
    debugPrint('Google Login attempt');
  }

  void _onForgotPasswordPressed() {
    debugPrint('Forgot Password pressed');
  }

  void _onSignUpPressed() {
    debugPrint('Sign Up pressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return _buildBody(context, state);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, LoginState state) {
    final l10n = AppLocalizations.of(context)!;

    switch (state.pageState) {
      case PageState.initial:
        return _buildLoginForm(l10n);
      case PageState.loading:
        return const AppLoadingIndicator();
      case PageState.error:
        return AppErrorView(
          message: state.errorMessage,
          onRetry: () => context.read<LoginCubit>().retrySignIn(l10n.genericError),
          onBack: () => context.read<LoginCubit>().reset(),
        );
    }
  }

  Widget _buildLoginForm(AppLocalizations l10n) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const LogoLogin(),
            const SizedBox(height: 32.0),
            LoginCard(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(l10n.loginButton, style: textTheme.titleMedium?.copyWith(color: colorScheme.onSurface)),
                    const SizedBox(height: 8.0),
                    Text(l10n.signInPrompt, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
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
                    const SizedBox(height: 12.0),
                    Column(
                      children: [
                        TextButton(
                          onPressed: _onForgotPasswordPressed,
                          child: Text(
                            l10n.forgotPassword,
                            style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              l10n.noAccount,
                              style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                            ),
                            TextButton(
                              onPressed: _onSignUpPressed,
                              child: Text(
                                l10n.signUp,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.primary,
                                  fontWeight: FontWeight.w400,
                                ),
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
    );
  }
}

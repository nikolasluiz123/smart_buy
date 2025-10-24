import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_buy/ui/screens/register_user/components/name_field.dart';
import 'package:smart_buy/ui/screens/register_user/register_user_cubit.dart';
import 'package:smart_buy/ui/screens/register_user/register_user_state.dart';

import '../../../constants/icons.dart';
import '../../../l10n/app_localizations.dart';
import '../../components/app_error_view.dart';
import '../../components/app_loading_indicator.dart';
import '../../components/button.dart';
import '../../components/google_login_button.dart';
import '../../components/labeled_horizontal_divider.dart';
import '../../components/states/page_state.dart';
import '../login/components/email_field.dart';
import '../login/components/login_card.dart';
import '../login/components/logo_login.dart';
import '../login/components/password_field.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _onRegisterUser() {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passwordController.text;
    final l10n = AppLocalizations.of(context)!;
    context.read<RegisterUserCubit>().register(name, email, password, l10n.genericError);
  }

  void _onRegisterUserWithGoogle() {
    debugPrint('Google Register attempt');
  }

  void _navigateLogin() {
    Navigator.of(context).pushNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: BlocBuilder<RegisterUserCubit, RegisterUserState>(
              builder: (context, state) {
                return _buildBody(context, state);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, RegisterUserState state) {
    final l10n = AppLocalizations.of(context)!;

    switch (state.pageState) {
      case PageState.initial:
        return _buildRegisterUserForm(l10n);
      case PageState.loading:
        return const AppLoadingIndicator();
      case PageState.error:
        return AppErrorView(
          message: state.errorMessage,
          onRetry: () => context.read<RegisterUserCubit>().retryRegister(l10n.genericError),
          onBack: () => context.read<RegisterUserCubit>().reset(),
        );
    }
  }

  Widget _buildRegisterUserForm(AppLocalizations l10n) {
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
                    Text(l10n.register, style: textTheme.titleMedium?.copyWith(color: colorScheme.onSurface)),
                    const SizedBox(height: 8.0),
                    Text(
                      l10n.registerMessage,
                      style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: 24.0),
                    NameField(controller: _nameController, icon: iconPerson),
                    const SizedBox(height: 16.0),
                    EmailField(controller: _emailController, icon: iconEmail),
                    const SizedBox(height: 16.0),
                    PasswordField(controller: _passwordController, icon: iconPadLock),
                    const SizedBox(height: 24.0),
                    PrimaryButton(label: l10n.register, onPressed: _onRegisterUser),
                    const SizedBox(height: 24.0),
                    LabeledHorizontalDivider(label: l10n.orDivider),
                    const SizedBox(height: 24.0),
                    GoogleLoginButton(
                      label: l10n.registerGoogleButton,
                      onGoogleLoginPressed: _onRegisterUserWithGoogle,
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          l10n.existingAccount,
                          style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                        TextButton(
                          onPressed: _navigateLogin,
                          child: Text(
                            l10n.loginButton,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

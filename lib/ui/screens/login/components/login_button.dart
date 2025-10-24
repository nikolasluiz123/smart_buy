import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onLoginPressed;
  const LoginButton({super.key, required this.onLoginPressed});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: onLoginPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(l10n.loginButton, style: const TextStyle(fontSize: 16)),
    );
  }
}

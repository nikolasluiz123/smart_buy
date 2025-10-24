import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../theme/colors.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onLoginPressed;
  const LoginButton({super.key, required this.onLoginPressed});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return ElevatedButton(
      onPressed: onLoginPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kSmartBuyBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Text(l10n.loginButton, style: TextStyle(fontSize: 16)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/icons.dart';

class GoogleLoginButton extends StatelessWidget {
  final String label;
  final VoidCallback onGoogleLoginPressed;
  const GoogleLoginButton(
      {super.key, required this.label, required this.onGoogleLoginPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(
      onPressed: onGoogleLoginPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: theme.colorScheme.surfaceContainerHighest,
        side: BorderSide(color: theme.colorScheme.onSurfaceVariant),
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconGoogle, width: 16, height: 16),
          const SizedBox(width: 12.0),
          Text(
            label,
            style: TextStyle(
                color: theme.colorScheme.onSurface,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

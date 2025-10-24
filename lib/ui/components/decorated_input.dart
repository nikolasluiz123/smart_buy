import 'package:flutter/material.dart';

import '../theme/theme.dart';

abstract class DecoratedInput extends StatelessWidget {
  const DecoratedInput({super.key});

  InputDecoration buildInputDecoration(BuildContext context, {required String hint, required Widget icon}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final appColors = theme.extension<AppColors>()!;

    return InputDecoration(
      prefixIcon: icon,
      hintText: hint,
      hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      filled: true,
      fillColor: appColors.fieldBackground,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: colorScheme.primary),
      ),
    );
  }
}

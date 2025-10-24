import 'package:flutter/material.dart';

import '../../../../constants/images.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../theme/theme.dart';

class LogoLogin extends StatelessWidget {
  const LogoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final appColors = theme.extension<AppColors>()!;

    return Column(
      children: [
        Image.asset(appLogo, width: 140, height: 140),
        Text(
          l10n.smartBuy,
          style: textTheme.headlineSmall?.copyWith(
            color: appColors.smartBuyBlue,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          l10n.welcomeBack,
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
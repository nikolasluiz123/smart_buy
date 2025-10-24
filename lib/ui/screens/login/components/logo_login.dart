import 'package:flutter/material.dart';

import '../../../../constants/images.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../theme/colors.dart';

class LogoLogin extends StatelessWidget {
  const LogoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        Image.asset(appLogo, width: 140, height: 140),
        Text(
          l10n.smartBuy,
          style: const TextStyle(color: kSmartBuyBlue, fontSize: 24, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8.0),
        Text(
          l10n.welcomeBack,
          style: const TextStyle(color: kMediumGrayText, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

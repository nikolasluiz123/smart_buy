import 'package:flutter/material.dart';

import '../theme/colors.dart';

class LabeledHorizontalDivider extends StatelessWidget {
  final String label;
  const LabeledHorizontalDivider({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: kGoogleButtonBorder)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(label, style: TextStyle(color: kMediumGrayText.withValues(alpha: 0.8), fontSize: 14)),
        ),
        const Expanded(child: Divider(color: kGoogleButtonBorder)),
      ],
    );
  }
}

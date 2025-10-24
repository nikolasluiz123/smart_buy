import 'package:flutter/material.dart';

import '../theme/theme.dart';

class LabeledHorizontalDivider extends StatelessWidget {
  final String label;

  const LabeledHorizontalDivider({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(child: Divider(color: theme.colorScheme.onSurfaceVariant)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            label,
            style: TextStyle(color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.8), fontSize: 14),
          ),
        ),
        Expanded(child: Divider(color: theme.colorScheme.onSurfaceVariant)),
      ],
    );
  }
}

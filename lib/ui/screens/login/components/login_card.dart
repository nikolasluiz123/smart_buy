import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  final Widget child;
  const LoginCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 4.0,
      shadowColor: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      color: theme.colorScheme.surfaceContainerHighest,
      child: Padding(padding: const EdgeInsets.all(24.0), child: child),
    );
  }
}

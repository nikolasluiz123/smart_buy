import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class AppErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final VoidCallback? onBack;

  const AppErrorView({
    super.key,
    required this.message,
    required this.onRetry,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              color: theme.colorScheme.error,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 48),
              ),
              child: Text(l10n.tryAgain),
            ),
            if (onBack != null) ...[
              const SizedBox(height: 12),
              TextButton(
                onPressed: onBack,
                child: Text(l10n.back),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

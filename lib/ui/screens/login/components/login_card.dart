import 'package:flutter/material.dart';

class LoginCard extends StatelessWidget {
  final Widget child;
  const LoginCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shadowColor: Colors.black.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      color: Color(0xFFFFFFFF),
      child: Padding(padding: const EdgeInsets.all(24.0), child: child),
    );
  }
}

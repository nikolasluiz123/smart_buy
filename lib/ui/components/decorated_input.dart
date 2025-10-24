import 'package:flutter/material.dart';

import '../theme/colors.dart';

abstract class DecoratedInput extends StatelessWidget {
  const DecoratedInput({super.key});

  InputDecoration buildInputDecoration({required String hint, required Widget icon}) {
    return InputDecoration(
      prefixIcon: icon,
      hintText: hint,
      hintStyle: const TextStyle(color: kMediumGrayText),
      filled: true,
      fillColor: kFieldBackground,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: kSmartBuyBlue),
      ),
    );
  }
}

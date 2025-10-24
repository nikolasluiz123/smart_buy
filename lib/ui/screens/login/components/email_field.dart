import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../components/decorated_input.dart';

class EmailField extends DecoratedInput {
  final TextEditingController controller;
  final String icon;

  const EmailField({super.key, required this.controller, required this.icon});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return TextFormField(
      controller: controller,
      decoration: buildInputDecoration(
        hint: l10n.emailHint,
        icon: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(icon, width: 20, height: 20),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return l10n.emailEmpty;
        }
        if (!value.contains('@')) {
          return l10n.emailInvalid;
        }
        return null;
      },
    );
  }
}

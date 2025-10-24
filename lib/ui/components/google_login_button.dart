import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/icons.dart';
import '../theme/colors.dart';

class GoogleLoginButton extends StatelessWidget {
  final String label;
  final VoidCallback onGoogleLoginPressed;
  const GoogleLoginButton({super.key, required this.label, required this.onGoogleLoginPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onGoogleLoginPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: kGoogleButtonBg,
        side: const BorderSide(color: kGoogleButtonBorder),
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconGoogle, width: 16, height: 16),
          const SizedBox(width: 12.0),
          Text(
            label,
            style: TextStyle(color: Color(0xFF3F4246), fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

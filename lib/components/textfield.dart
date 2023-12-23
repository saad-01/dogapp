import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key, required this.hintText, this.suffixIcon, this.keyboardType, required this.obscureText});
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 371,
      height: 56,
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0x3F737373)),
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 6,
            offset: Offset(-2, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: suffixIcon ?? const SizedBox(),
              border: InputBorder.none,
              hintStyle: Styles.expertSignupPaget2(),
              hintText: hintText),
        ),
      ),
    );
  }
}

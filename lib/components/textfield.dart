import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      this.keyboardType,
      required this.obscureText,
      this.controller,
      this.focusNode,
      this.onFieldSubmitted,
      this.validator,
      this.isError});
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool? isError;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: isError != null
          ? isError!
              ? BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(width: 2, color: AppColors.red),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                )
              : ShapeDecoration(
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0x3F737373)),
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
                )
          : ShapeDecoration(
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
        child: TextFormField(
          textInputAction: TextInputAction.go,
          textCapitalization: TextCapitalization.sentences,
          obscureText: obscureText,
          keyboardType: keyboardType,
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
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

import 'package:dogapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class Styles {
  static TextStyle splashHeading() {
    return const TextStyle(
      color: AppColors.white,
      fontSize: 53,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle sliderHeading() {
    return const TextStyle(
      color: AppColors.white,
      fontSize: 28,
      fontWeight: FontWeight.w500,
      height: 0,
    );
  }

  static TextStyle sliderText() {
    return const TextStyle(
      color: AppColors.white,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 0,
    );
  }

  static TextStyle choosePageHeading() {
    return const TextStyle(
      color: AppColors.primaryColor,
      fontSize: 28,
    );
  }

  static TextStyle choosePageText() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 12,
    );
  }

  static TextStyle expertSignupPageH1() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 20,
    );
  }

  static TextStyle expertSignupPageH2() {
    return const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 18,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryColor);
  }

  static TextStyle expertSignupPaget1() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 16,
    );
  }

  static TextStyle expertSignupPaget2() {
    return TextStyle(
      color: AppColors.black.withOpacity(0.6000000238418579),
      fontSize: 14,
    );
  }

  static TextStyle btnStyle1() {
    return const TextStyle(
        color: AppColors.white, fontSize: 20, fontWeight: FontWeight.w600);
  }
}

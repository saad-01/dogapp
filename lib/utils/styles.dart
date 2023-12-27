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

  static TextStyle primary20() {
    return const TextStyle(
      color: AppColors.primaryColor,
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

  static TextStyle primary16U() {
    return const TextStyle(
        color: AppColors.primaryColor,
        fontSize: 16,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryColor);
  }

  static TextStyle expertSignupPaget1() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 16,
    );
  }

  static TextStyle primaryText() {
    return const TextStyle(
      color: AppColors.primaryColor,
      fontSize: 16,
    );
  }

  static TextStyle deleteText() {
    return const TextStyle(
      color: Color(0xFFCC0000),
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

  static TextStyle subText() {
    return const TextStyle(
      color: Color(0xFF3E3E3E),
      fontSize: 12,
    );
  }

  static TextStyle subYellowText() {
    return const TextStyle(
      color: AppColors.yellowColor,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.yellowColor,
      fontSize: 12,
    );
  }

  static TextStyle primary12UText() {
    return const TextStyle(
      color: AppColors.primaryColor,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.primaryColor,
      fontSize: 12,
    );
  }

  static TextStyle denial12UText() {
    return const TextStyle(
      color: AppColors.statustxt2,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.statustxt2,
      fontSize: 12,
    );
  }

  static TextStyle homeH1() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 24,
    );
  }

  static TextStyle appointSub() {
    return const TextStyle(
      color: AppColors.lightGreyColor,
      fontSize: 10,
    );
  }

  static TextStyle lightGrey12() {
    return const TextStyle(
      color: AppColors.lightGreyColor,
      fontSize: 12,
    );
  }

  static TextStyle black10Sub() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 10,
    );
  }

  static TextStyle subPrimaryText() {
    return const TextStyle(
      color: AppColors.primaryColor,
      fontSize: 12,
    );
  }

  static TextStyle primary8Txt() {
    return const TextStyle(
      color: AppColors.primaryColor,
      fontSize: 8,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle primary10Txt() {
    return const TextStyle(
      color: AppColors.primaryColor,
      fontSize: 10,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle white10Txt() {
    return const TextStyle(
      color: AppColors.white,
      fontSize: 10,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle approvalTxt() {
    return const TextStyle(
      color: AppColors.primaryColor,
      fontSize: 8,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.primaryColor,
    );
  }

  static TextStyle denialTxt() {
    return const TextStyle(
      color: AppColors.statustxt2,
      fontSize: 8,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.statustxt2,
    );
  }

  static TextStyle appBarH1() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle grey14() {
    return const TextStyle(
      color: AppColors.grey,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle grey8() {
    return const TextStyle(
      color: AppColors.grey,
      fontSize: 8,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle black14() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle noteTxt() {
    return const TextStyle(
      color: AppColors.black,
      fontSize: 12,
    );
  }

  static TextStyle white16UTxt() {
    return const TextStyle(
      color: AppColors.white,
      fontSize: 16,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.white,
    );
  }

  static TextStyle white16() {
    return const TextStyle(
      color: AppColors.white,
      fontSize: 16,
    );
  }

  static TextStyle grey16() {
    return const TextStyle(
      color: AppColors.grey,
      fontSize: 16,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.white,
    );
  }

  static TextStyle primary20G() {
    return const TextStyle(
      fontSize: 16,
      color: AppColors.primaryColor,
    );
  }

  static TextStyle white18() {
    return const TextStyle(
      fontSize: 18,
      color: AppColors.white,
    );
  }

  static TextStyle weight() {
    return TextStyle(
      color: AppColors.black.withOpacity(0.6000000238418579),
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle maroon20() {
    return const TextStyle(
      color: AppColors.maroonColor,
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle yellow8U() {
    return const TextStyle(
      color: AppColors.yellowColor,
      fontSize: 8,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.yellowColor,
      fontWeight: FontWeight.w400,
    );
  }


}

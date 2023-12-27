import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlternatingButton extends StatelessWidget {
  const AlternatingButton(
      {super.key, required this.title, required this.outlined});
  final String title;
  final bool outlined;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          Get.toNamed(RouteName.releasedReportPage);
        },
        child: Ink(
          width: 102,
          height: 28,
          decoration: ShapeDecoration(
            color: outlined ? AppColors.white : AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: outlined ? Styles.primary10Txt() : Styles.white10Txt(),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/assets.dart';
import '../utils/styles.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem(
      {super.key,
      required this.heading,
      required this.foodName,
      required this.timeHeading,
      required this.time,
      this.onPress, required this.note, required this.quantity});
  final String heading;
  final String foodName;
  final String timeHeading;
  final String time;
  final String note;
  final String quantity;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            color: AppColors.black.withOpacity(0.11999999731779099),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                heading.tr,
                style: Styles.subPrimaryText(),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${AppStrings.foodName.tr}:",
                style: Styles.lightGrey12(),
              ),
              Text(
                foodName.tr,
                style: Styles.lightGrey12(),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$timeHeading:",
                style: Styles.lightGrey12(),
              ),
              Text(
                time.tr,
                style: Styles.lightGrey12(),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${AppStrings.quantity.tr}:",
                style: Styles.lightGrey12(),
              ),
              Text(
                quantity.tr,
                style: Styles.lightGrey12(),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${AppStrings.notes.tr}:",
                style: Styles.lightGrey12(),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                note.tr,
                style: Styles.lightGrey12(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/styles.dart';

class CouponItem extends StatelessWidget {
  const CouponItem(
      {super.key,
      required this.heading,
      required this.expertName,
      this.onPress});
  final String heading;
  final String expertName;
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
              IconButton(onPressed: onPress, icon: const Icon(Icons.copy, size: 18,))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${AppStrings.expertName.tr}:",
                style: Styles.lightGrey12(),
              ),
              Text(
                expertName.tr,
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
                AppStrings.getOff.tr,
                style: Styles.lightGrey12(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

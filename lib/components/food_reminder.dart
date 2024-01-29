import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets.dart';
import '../utils/styles.dart';

class FoodReminderItem extends StatelessWidget {
  const FoodReminderItem(
      {super.key,
      required this.heading,
      required this.foodName,
      required this.timeHeading,
      required this.time,
      this.onPress});
  final String heading;
  final String foodName;
  final String timeHeading;
  final String time;
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
                heading,
                style: Styles.subPrimaryText(),
              ),
              GestureDetector(
                onTap: onPress,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.edit,
                        style: Styles.subYellowText(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(AssetImages.nextYellowIcon),
                    ],
                  ),
                ),
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
                "${AppStrings.foodName}:",
                style: Styles.lightGrey12(),
              ),
              Text(
                foodName,
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
                time,
                style: Styles.lightGrey12(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

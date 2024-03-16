import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class TrainingStreakWidget extends StatelessWidget {
  const TrainingStreakWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            color: Colors.black.withOpacity(0.11999999731779099),
          ),
          borderRadius: BorderRadius.circular(10),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.trainingStreak.tr,
            style: Styles.primaryText(),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SvgPicture.asset(AssetImages.currentStreak),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    AppStrings.days0.tr,
                    style: Styles.black14(),
                  ),
                  Text(
                    AppStrings.currentStreak.tr,
                    style: Styles.black10Sub(),
                  )
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset(AssetImages.longStreak),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    AppStrings.days1.tr,
                    style: Styles.black14(),
                  ),
                  Text(
                    AppStrings.longestStreak.tr,
                    style: Styles.black10Sub(),
                  )
                ],
              ),
              Column(
                children: [
                  SvgPicture.asset(AssetImages.stopWatch),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    AppStrings.timeStamp.tr,
                    style: Styles.black14(),
                  ),
                  Text(
                    AppStrings.timeTrained.tr,
                    style: Styles.black10Sub(),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

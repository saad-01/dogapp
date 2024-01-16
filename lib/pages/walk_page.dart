import 'package:dogapp/components/alternating_btn.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';

import '../components/btn_sm.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/styles.dart';

class WalkPage extends StatelessWidget {
  const WalkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.walk),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 25, left: 15, right: 15, bottom: 25),
                            decoration: ShapeDecoration(
                              color: AppColors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.50,
                                  color: Colors.black
                                      .withOpacity(0.11999999731779099),
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
                              children: [
                                const SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  AppStrings.nameCapital,
                                  style: Styles.expertSignupPaget1(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  AppStrings.releaseDogData,
                                  style: Styles.expertSignupPaget1(),
                                ),
                                Text(
                                  AppStrings.createRelease,
                                  style: Styles.subText(),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const ButtonSmall(
                                        title: AppStrings.editRecord,
                                        icon: AssetImages.editIcon,
                                        primaryAlike: false,
                                        color: AppColors.white),
                                    ButtonSmall(
                                      title: AppStrings.shareRecord,
                                      icon: AssetImages.shareIcon,
                                      primaryAlike: true,
                                      color: AppColors.primaryColor
                                          .withOpacity(0.15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          child: SizedBox(
                            height: 86,
                            width: 86,
                            child: Image.asset(
                              AssetImages.dogItemPng,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 128,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                          ),
                          decoration: ShapeDecoration(
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                color: AppColors.black
                                    .withOpacity(0.11999999731779099),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x1E000000),
                                blurRadius: 8,
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '212',
                                style: Styles.primary24(),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Km',
                                style: Styles.expertSignupPageH1(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                AppStrings.totalDistance,
                                style: Styles.noteTxt(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            height: 128,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            decoration: ShapeDecoration(
                              color: AppColors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.50,
                                  color: AppColors.black
                                      .withOpacity(0.11999999731779099),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x1E000000),
                                  blurRadius: 8,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(AssetImages.footPrint),
                                    Text(
                                      '1205',
                                      style: Styles.primary24(),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      AppStrings.totalSteps,
                                      style: Styles.noteTxt(),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(AssetImages.backup),
                                    Text(
                                      '00:00',
                                      style: Styles.primary24(),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      AppStrings.duration,
                                      style: Styles.noteTxt(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 128,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: ShapeDecoration(
                              color: AppColors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.50,
                                  color: AppColors.black
                                      .withOpacity(0.11999999731779099),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x1E000000),
                                  blurRadius: 8,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppStrings.recentWalk,
                                  style: Styles.noteTxt(),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '2',
                                          style: Styles.primary24(),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Km',
                                          style: Styles.noteTxt(),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '00:00',
                                          style: Styles.primary24(),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          AppStrings.minutes,
                                          style: Styles.noteTxt(),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '124',
                                          style: Styles.primary24(),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          AppStrings.steps,
                                          style: Styles.noteTxt(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    AlternatingButton(
                        title: AppStrings.addRecordManually,
                        outlined: true,
                        width: MediaQuery.sizeOf(context).width,
                        height: 62,
                        withIcon: true,
                        icon: AssetImages.addIcon,
                        style: Styles.primary14(),
                        onPress: () {
                          Get.toNamed(RouteName.addWalkPage);
                        }),
                    const SizedBox(
                      height: 12,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 62,
                      decoration: ShapeDecoration(
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            color: AppColors.black
                                .withOpacity(0.11999999731779099),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: SwipeButton(
                        height: 60,
                        borderRadius: BorderRadius.circular(8),
                        activeThumbColor: AppColors.primaryColor,
                        activeTrackColor: Colors.white,
                        thumb: SvgPicture.asset(
                          AssetImages.swipe,
                        ),
                        child: Text(
                          AppStrings.swipe,
                          style: Styles.black14(),
                        ),
                        onSwipeEnd: () {
                          Get.toNamed(RouteName.walkRecordPage);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

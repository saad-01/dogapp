import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/appbar.dart';
import '../components/custom_tile.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';

class ExpertExercisePage extends StatelessWidget {
  const ExpertExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(
              title: AppStrings.exercises.tr,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTile(
                      title: AppStrings.exercises.tr,
                      leading: AssetImages.swimDog,
                      trailing: AssetImages.nextBlackIcon,
                      clr: AppColors.white,
                      onPress: () {
                        Get.toNamed(RouteName.expertExDetailPage);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTile(
                      title: AppStrings.games.tr,
                      leading: AssetImages.playDog,
                      trailing: AssetImages.nextBlackIcon,
                      clr: AppColors.white,
                      onPress: () {
                        // Get.toNamed(RouteName.makeAnnouncementPage);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTile(
                      title: AppStrings.goodManners.tr,
                      leading: AssetImages.tickDog,
                      trailing: AssetImages.nextBlackIcon,
                      clr: AppColors.white,
                      onPress: () {
                        // Get.toNamed(RouteName.makeAnnouncementPage);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.trainingPrograms.tr,
                          style: Styles.expertSignupPaget1(),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 145,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(1.00, 0.00),
                          end: Alignment(-1, 0),
                          colors: [Color(0xFF003D7D), Color(0xFF003D7D)],
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            color:
                                Colors.black.withOpacity(0.11999999731779099),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.stopBitting.tr,
                                  style: Styles.white16(),
                                ),
                                Expanded(
                                    child: Text(
                                  AppStrings.bittingNote.tr,
                                  style: Styles.white8(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                LinearProgressIndicator(
                                  value: 0.45,
                                  borderRadius: BorderRadius.circular(100),
                                  minHeight: 9,
                                  color: const Color(0xFFd60285),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.theory.tr,
                                      style: Styles.white8(),
                                    ),
                                    Text(
                                      '45%',
                                      style: Styles.white8(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                LinearProgressIndicator(
                                  value: 0.55,
                                  borderRadius: BorderRadius.circular(100),
                                  minHeight: 9,
                                  color: const Color(0xFFdb8041),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.exercises.tr,
                                      style: Styles.white8(),
                                    ),
                                    Text(
                                      '55%',
                                      style: Styles.white8(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AssetImages.stopBitting),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: 145,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: ShapeDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(1.00, 0.00),
                          end: Alignment(-1, 0),
                          colors: [Color(0xFF7D3F00), Color(0xFF623100)],
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            color:
                                Colors.black.withOpacity(0.11999999731779099),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.payAttention.tr,
                                  style: Styles.white16(),
                                ),
                                Expanded(
                                    child: Text(
                                  AppStrings.payAttenNote.tr,
                                  style: Styles.white8(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                LinearProgressIndicator(
                                  value: 0.45,
                                  borderRadius: BorderRadius.circular(100),
                                  minHeight: 9,
                                  color: const Color(0xFF029ed7),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.theory.tr,
                                      style: Styles.white8(),
                                    ),
                                    Text(
                                      '45%',
                                      style: Styles.white8(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                LinearProgressIndicator(
                                  value: 0.55,
                                  borderRadius: BorderRadius.circular(100),
                                  minHeight: 9,
                                  color: const Color(0xFF19b70a),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.exercises.tr,
                                      style: Styles.white8(),
                                    ),
                                    Text(
                                      '55%',
                                      style: Styles.white8(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AssetImages.payAttention),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PrimartyButton(
                        title: AppStrings.addTraining.tr,
                        width: 250,
                        height: 15,
                        onTap: () {
                          Get.toNamed(RouteName.addTrainingPage);
                        },
                        icon: AssetImages.addWhiteIcon),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

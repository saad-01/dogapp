import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/expert_item.dart';
import 'package:dogapp/components/outlined_red_btn.dart';
import 'package:dogapp/components/training_streak.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReleasedReportPage extends StatelessWidget {
  const ReleasedReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.releasedReport.tr),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  ExpertItem(
                      expertis: AppStrings.trainExpert.tr,
                      filledBtnTitle: AppStrings.seeProfileBtn.tr),
                  const SizedBox(
                    height: 36,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 10, left: 15, right: 15, bottom: 25),
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
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  Text(
                                    AppStrings.nameCapital.tr,
                                    style: Styles.expertSignupPaget1(),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${AppStrings.dogName.tr}:',
                                          style: Styles.grey14()),
                                      Text(
                                        AppStrings.dogNameH.tr,
                                        style: Styles.black14(),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${AppStrings.breed.tr}:',
                                          style: Styles.grey14()),
                                      Text(
                                        AppStrings.breed.tr,
                                        style: Styles.black14(),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${AppStrings.dateOfBirth.tr}:',
                                          style: Styles.grey14()),
                                      Text(
                                        AppStrings.dateFormat.tr,
                                        style: Styles.black14(),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${AppStrings.gender.tr}:',
                                          style: Styles.grey14()),
                                      Text(
                                        AppStrings.gender.tr,
                                        style: Styles.black14(),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${AppStrings.weight.tr}:',
                                          style: Styles.grey14()),
                                      Text(
                                        AppStrings.weight.tr,
                                        style: Styles.black14(),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${AppStrings.microChipNum.tr}:',
                                          style: Styles.grey14()),
                                      Text(
                                        AppStrings.microChipNum.tr,
                                        style: Styles.black14(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
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
                  const TrainingStreakWidget(),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomOutlinedButton(
                      title: AppStrings.endSharing.tr,
                      width: MediaQuery.sizeOf(context).width * 0.8),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}

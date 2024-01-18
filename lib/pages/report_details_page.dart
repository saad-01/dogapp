import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/training_streak.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';

class ReportDetailsPage extends StatelessWidget {
  const ReportDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.trainReport),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(AssetImages.editReport)
                                ],
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    AppStrings.nameCapital,
                                    style: Styles.expertSignupPaget1(),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${AppStrings.dogName}:',
                                          style: Styles.grey14()),
                                      Text(
                                        AppStrings.dogNameH,
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
                                      Text('${AppStrings.breed}:',
                                          style: Styles.grey14()),
                                      Text(
                                        AppStrings.breed,
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
                                      Text('${AppStrings.dateOfBirth}:',
                                          style: Styles.grey14()),
                                      Text(
                                        AppStrings.dateFormat,
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
                                      Text('${AppStrings.gender}:',
                                          style: Styles.grey14()),
                                      Text(
                                        AppStrings.gender,
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
                                      Text('${AppStrings.weight}:',
                                          style: Styles.grey14()),
                                      Text(
                                        AppStrings.weight,
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
                                      Text('${AppStrings.microChipNum}:',
                                          style: Styles.grey14()),
                                      Text(
                                        AppStrings.microChipNum,
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
                    height: 120,
                  ),
                  PrimartyButton(
                      onTap: () {
                        Get.toNamed(RouteName.selectExpertPage);
                      },
                      title: AppStrings.share,
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      height: 10,
                      icon: '')
                ],
              ),
            )),
          ],
        ),
      )),
    );
  }
}

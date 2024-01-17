import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/expert_item.dart';
import 'package:dogapp/components/outlined_red_btn.dart';
import 'package:dogapp/components/training_streak.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';

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
            const CustomAppBar(title: AppStrings.releasedReport),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const ExpertItem(
                      expertis: AppStrings.trainExpert,
                      filledBtnTitle: AppStrings.seeProfileBtn),
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
                          left: 120,
                          top: 0,
                          child: Container(
                            width: 86,
                            height: 86,
                            decoration: ShapeDecoration(
                              image: const DecorationImage(
                                image: AssetImage(AssetImages.dogItem),
                                fit: BoxFit.cover,
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1.50, color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ))
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
                      title: AppStrings.endSharing,
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

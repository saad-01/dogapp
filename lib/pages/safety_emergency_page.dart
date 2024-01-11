import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/miss_dog_item.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/primary_btn.dart';
import '../routes/route_names.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/styles.dart';

class SafetyEmergencyPage extends StatelessWidget {
  const SafetyEmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.safetyEmergency),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.84,
                    height: 73,
                    decoration: ShapeDecoration(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0x1E010101)),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x1E000000),
                          blurRadius: 8,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(
                      child: ListTile(
                        leading: SvgPicture.asset(AssetImages.telephone),
                        trailing: SvgPicture.asset(AssetImages.nextBlackIcon),
                        title: Text(
                          AppStrings.seeEmergencyNum,
                          style: Styles.black14(),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          Get.toNamed(RouteName.createDietPlanPage);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                color: AppColors.black
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
                                height: 90,
                              ),
                              Text(
                                AppStrings.missingFound,
                                style: Styles.primary20G(),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                AppStrings.missingNote,
                                style: Styles.lightGrey12(),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              PrimartyButton(
                                  title: AppStrings.addFood,
                                  width: 170,
                                  height: 12,
                                  onTap: () {
                                    Get.toNamed(RouteName.addFoodPage);
                                  },
                                  icon: '')
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: SvgPicture.asset(
                            AssetImages.missDog,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.impInstructions,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.emergencyCases,
                      style: Styles.lightGrey12(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.dietPlanPage);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18),
                      // height: 101,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFF9F2),
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
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.inCaseEmergency,
                                  style: Styles.expertSignupPaget1(),
                                ),
                                Text(
                                  AppStrings.noteEmergency,
                                  style: Styles.grey8(),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          SvgPicture.asset(AssetImages.blueLight)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.notifications,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const MissDogItem(
                    title: AppStrings.missingDog,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const MissDogItem(
                    title: AppStrings.foundedDog,
                  ),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}

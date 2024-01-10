import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/styles.dart';

class FeedManagePage extends StatelessWidget {
  const FeedManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.feedManage),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
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
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppStrings.foodManagement,
                                  style: Styles.primary20G(),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                AppStrings.feedNote,
                                style: Styles.lightGrey12(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const PrimartyButton(
                                  title: AppStrings.addFood,
                                  width: 170,
                                  height: 12,
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
                            AssetImages.dogFood,
                            width: 126,
                            height: 94,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.dailFoodReminders,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.planDogExperts,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 18),
                    height: 101,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFFF9F2),
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.dietPlan,
                                style: Styles.expertSignupPaget1(),
                              ),
                              Text(
                                AppStrings.dietNote,
                                style: Styles.grey8(),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        SvgPicture.asset(AssetImages.dogFood)
                      ],
                    ),
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

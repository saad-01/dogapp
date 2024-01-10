import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';

class ExpertFeedPage extends StatelessWidget {
  const ExpertFeedPage({super.key});

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
                            AssetImages.dogFood,
                            width: 126,
                            height: 94,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.84,
                    height: 81,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF256B90),
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
                        leading: SvgPicture.asset(AssetImages.createPlan),
                        trailing: SvgPicture.asset(AssetImages.nextWhiteIcon),
                        title: Text(
                          AppStrings.createFoodorDiet,
                          style: Styles.white16(),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          Get.toNamed(RouteName.createDietPlanPage);
                        },
                      ),
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

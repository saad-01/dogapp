import 'package:dogapp/components/alternating_btn.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../components/textfield.dart';
import '../components/training_streak.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/styles.dart';

class ReportEditPage extends StatelessWidget {
  const ReportEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          CustomAppBar(title: AppStrings.editReport.tr),
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
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.anyHealthIssue.tr,
                    style: Styles.expertSignupPaget1(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                  hintText: AppStrings.hintHealthIssues.tr,
                  obscureText: false,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SvgPicture.asset(AssetImages.selectFieldIcon),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.totalAppointments.tr,
                    style: Styles.expertSignupPaget1(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomTextfield(
                  hintText: '00',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 18,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.recentDiseases.tr,
                    style: Styles.expertSignupPaget1(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                  hintText: AppStrings.hintRecentDisease.tr,
                  obscureText: false,
                ),
                const SizedBox(
                  height: 18,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.dogBehaviour.tr,
                    style: Styles.expertSignupPaget1(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextfield(
                  hintText: AppStrings.hintDogBehaviour.tr,
                  obscureText: false,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SvgPicture.asset(AssetImages.selectFieldIcon),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.addFiles.tr,
                    style: Styles.expertSignupPaget1(),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    AlternatingButton(
                      title: AppStrings.photo.tr,
                      outlined: false,
                      width: 139,
                      height: 54,
                      icon: AssetImages.galleryIcon,
                      withIcon: true,
                      style: Styles.white16(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AlternatingButton(
                      title: AppStrings.files.tr,
                      outlined: true,
                      width: 139,
                      height: 54,
                      icon: AssetImages.fileIcon,
                      withIcon: true,
                      style: Styles.primaryText(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                AlternatingButton(
                    title: AppStrings.save.tr,
                    outlined: true,
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    height: 52,
                    style: Styles.primary20(),
                    withIcon: false),
                const SizedBox(
                  height: 20,
                ),
                PrimartyButton(
                    title: AppStrings.share.tr,
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    height: 12,
                    icon: ''),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ))
        ],
      ),
    )));
  }
}

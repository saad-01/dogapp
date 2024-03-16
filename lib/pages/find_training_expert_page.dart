import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class FindTrainExpertPage extends StatelessWidget {
  const FindTrainExpertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.trainExpert.tr),
            const SizedBox(
              height: 10,
            ),
            CustomTextfield(
              hintText: AppStrings.searchByName.tr,
              obscureText: false,
              suffixIcon: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(AssetImages.searchIcon)),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    color: AppColors.lightGreyColor,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    AppStrings.or.tr,
                    style: Styles.lightGrey12(),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    color: AppColors.lightGreyColor,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.only(bottom: 15),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF01637E),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.50,
                          color:
                              AppColors.black.withOpacity(0.11999999731779099),
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
                          AppStrings.sendInvite.tr,
                          style: Styles.sliderText(),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        SizedBox(
                          width: 226,
                          child: Text(
                            AppStrings.sendLocally.tr,
                            style: Styles.white12(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Material(
                          color: Colors.transparent,
                          child: Ink(
                            width: 170,
                            height: 28,
                            decoration: ShapeDecoration(
                              color: AppColors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Center(
                              child: Text(
                                AppStrings.invite.tr,
                                style: const TextStyle(
                                  color: Color(0xFF01637E),
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
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
                    height: 107,
                    width: 107,
                    child: Image.asset(
                      AssetImages.trainingExpert,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}

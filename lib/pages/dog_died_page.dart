import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/appbar.dart';
import '../components/primary_btn.dart';
import '../components/textfield.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';

class DogDiedPage extends StatelessWidget {
  const DogDiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.dogDied),
            Expanded(
              flex: 3,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.reason,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomTextfield(
                      hintText: AppStrings.typeReason,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.dateOfBirth,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextfield(
                      hintText: AppStrings.dateFormat,
                      obscureText: false,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SvgPicture.asset(
                          AssetImages.dateIcon,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.deathDate,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextfield(
                      hintText: AppStrings.dateFormat,
                      obscureText: false,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SvgPicture.asset(
                          AssetImages.dateIcon,
                          colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.notes,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomTextfield(
                      hintText: AppStrings.typeNotes,
                      obscureText: false,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF018383),
                        ),
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  AppStrings.sendArchive,
                  style: Styles.expertSignupPaget1(),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF018383),
                        ),
                        borderRadius: BorderRadius.circular(6)),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  AppStrings.dontShow,
                  style: Styles.expertSignupPaget1(),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            PrimartyButton(
                title: AppStrings.save,
                width: MediaQuery.sizeOf(context).width * 0.81,
                height: 10,
                icon: ''),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}

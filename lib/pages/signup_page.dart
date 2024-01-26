import 'package:flutter/material.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../components/intro_btn.dart';
import '../utils/app_colors.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(fit: StackFit.loose, children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.sizeOf(context).height * 0.6,
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: const AssetImage(AssetImages.backgroundImage),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      AppColors.black
                          .withOpacity(0.68), // Adjust opacity as needed
                      BlendMode.darken,
                    ),
                  )),
                ),
                Positioned(
                    top: 20,
                    left: (MediaQuery.sizeOf(context).width / 2) - (270 / 2),
                    child: Column(
                      children: [
                        Container(
                          width: 107,
                          height: 107,
                          padding: const EdgeInsets.all(20),
                          decoration: ShapeDecoration(
                            color: AppColors.white
                                .withOpacity(0.07999999821186066),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1.50, color: AppColors.white),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: SvgPicture.asset(
                            AssetImages.outlinedDog,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppStrings.loginORsignup.toUpperCase(),
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 280,
                          child: Text(
                            AppStrings.signupTxt,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      AssetImages.singupBg,
                      height: MediaQuery.sizeOf(context).height * 0.58,
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width,
                    )),
                Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          IntroBtn(
                            title: AppStrings.google,
                            clr: AppColors.white,
                            showIcon: true,
                            icon: AssetImages.google,
                            onPress: () {
                              Get.offNamed(RouteName.signupPage);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            AppStrings.or,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          IntroBtn(
                            title: AppStrings.mail,
                            clr: AppColors.yellowColor,
                            icon: AssetImages.mail,
                            showIcon: true,
                            onPress: () {
                              Get.offNamed(RouteName.chooseProfilePage);
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                AppStrings.alreadyAccount,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(RouteName.loginPage);
                                  },
                                  child: Text(
                                    AppStrings.login.toUpperCase(),
                                    style: const TextStyle(
                                        color: AppColors.white,
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            AppStrings.agreeing,
                            maxLines: 2,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.loginPage);
                              },
                              child: Text(
                                AppStrings.policy.toUpperCase(),
                                maxLines: 2,
                                style: const TextStyle(
                                    color: AppColors.white,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

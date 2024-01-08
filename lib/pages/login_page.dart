import 'package:dogapp/components/textfield.dart';
import 'package:flutter/material.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../components/intro_btn.dart';
import '../utils/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(fit: StackFit.loose, children: [
                Container(
                  height: height * 0.7,
                  constraints: BoxConstraints(
                    maxHeight: height * 0.6,
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
                    top: 60,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          width: 134,
                          height: 134,
                          padding: const EdgeInsets.all(25),
                          decoration: ShapeDecoration(
                            color: AppColors.white
                                .withOpacity(0.07999999821186066),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1.50, color: Colors.white),
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
                          AppStrings.login.toUpperCase(),
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      AssetImages.loginBg,
                      fit: BoxFit.cover,
                      width: width,
                    )),
                Positioned(
                    bottom: 30,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: width,
                      child: Column(
                        children: [
                          const CustomTextfield(
                            hintText: AppStrings.typeYourMail,
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomTextfield(
                            hintText: AppStrings.typePassword,
                            obscureText: false,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text(
                                AppStrings.forgetPass,
                                maxLines: 2,
                                style: TextStyle(
                                  color: AppColors.white,
                                  decorationColor: AppColors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          IntroBtn(
                            title: AppStrings.login,
                            clr: AppColors.yellowColor,
                            showIcon: false,
                            onPress: () {
                              Get.offNamed(RouteName.chooseProfilePage);
                            },
                          ),
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

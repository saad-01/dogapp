import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/view_models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../components/intro_btn.dart';
import '../utils/app_colors.dart';
import '../utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginVM = Get.put(LoginModel());
  final _formkey = GlobalKey<FormState>();
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
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: width,
                      child: Column(
                        children: [
                          Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  Obx(
                                    () => CustomTextfield(
                                      hintText: AppStrings.typeYourMail,
                                      obscureText: false,
                                      isError: loginVM.mailError.value,
                                      controller: loginVM.emailController.value,
                                      focusNode: loginVM.emailFocusNode.value,
                                      onFieldSubmitted: (value) {
                                        Utils.fieldFocusChange(
                                            context,
                                            loginVM.emailFocusNode.value,
                                            loginVM.passwordFocusNode.value);
                                        if (value.isEmpty) {
                                          loginVM.mailError.value = true;
                                        } else {
                                          loginVM.mailError.value = false;
                                        }
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Obx(
                                    () => CustomTextfield(
                                      hintText: AppStrings.typePassword,
                                      isError: loginVM.passwordError.value,
                                      obscureText:
                                          loginVM.passwordVisible.value,
                                      focusNode:
                                          loginVM.passwordFocusNode.value,
                                      controller:
                                          loginVM.passwordController.value,
                                      onFieldSubmitted: (value) {
                                        if (value.isEmpty) {
                                          loginVM.passwordError.value = true;
                                        } else {
                                          loginVM.passwordError.value = false;
                                        }
                                      },
                                      suffixIcon: loginVM.passwordVisible.value
                                          ? GestureDetector(
                                              onTap: () {
                                                if (loginVM
                                                    .passwordVisible.value) {
                                                  loginVM.passwordVisible
                                                      .value = false;
                                                } else {
                                                  loginVM.passwordVisible
                                                      .value = true;
                                                }
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(Icons.visibility),
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                if (loginVM
                                                    .passwordVisible.value) {
                                                  loginVM.passwordVisible
                                                      .value = false;
                                                } else {
                                                  loginVM.passwordVisible
                                                      .value = true;
                                                }
                                              },
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child:
                                                    Icon(Icons.visibility_off),
                                              )),
                                    ),
                                  ),
                                ],
                              )),
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
                            height: 30,
                          ),
                          Obx(
                            () => IntroBtn(
                              title: AppStrings.login,
                              clr: AppColors.yellowColor,
                              showIcon: false,
                              onPress: () {
                                if (_formkey.currentState!.validate()) {
                                  loginVM.loginUser();
                                }
                              },
                              loading: loginVM.loading.value,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                AppStrings.noAccount,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    AppStrings.signup.toUpperCase(),
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

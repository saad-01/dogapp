import 'dart:io';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/pic_container.dart';
import '../components/primary_btn.dart';
import '../components/textfield.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class ParentSignupPage extends StatefulWidget {
  const ParentSignupPage({super.key});

  @override
  State<ParentSignupPage> createState() => _ParentSignupPageState();
}

class _ParentSignupPageState extends State<ParentSignupPage> {
  final signupVM = Get.put(ParentSignupModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                AppStrings.setProfileExpert,
                style: Styles.expertSignupPageH1(),
              ),
              const SizedBox(
                height: 50,
              ),
              Obx(
                () => signupVM.imageFlag.value
                    ? const SizedBox()
                    : SvgPicture.asset(AssetImages.expertIcon),
              ),
              const SizedBox(
                height: 30,
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            signupVM.imageFlag.value
                                ? PicContainer(
                                    width: 86,
                                    height: 86,
                                    child: Image.file(
                                      File(signupVM.image!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Row(
                                    children: [
                                      SvgPicture.asset(AssetImages.addIcon),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          signupVM.selectImage();
                                        },
                                        child: Text(
                                          AppStrings.uploadYourPhoto,
                                          style: Styles.expertSignupPageH2(),
                                        ),
                                      )
                                    ],
                                  ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.yourName,
                          style: Styles.expertSignupPaget1(),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextfield(
                        hintText: AppStrings.typeYourname,
                        obscureText: false,
                        controller: signupVM.nameController.value,
                        focusNode: signupVM.nameFocusNode.value,
                        onFieldSubmitted: (p0) {
                          Utils.fieldFocusChange(
                              context,
                              signupVM.nameFocusNode.value,
                              signupVM.dateFocusNode.value);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(AppStrings.dateOfBirth,
                              style: Styles.expertSignupPaget1())),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextfield(
                        hintText: AppStrings.dateFormat,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        controller: signupVM.dateController.value,
                        focusNode: signupVM.dateFocusNode.value,
                        onFieldSubmitted: (p0) {
                          Utils.fieldFocusChange(
                              context,
                              signupVM.dateFocusNode.value,
                              signupVM.emailFocusNode.value);
                        },
                        suffixIcon: GestureDetector(
                          onTap: () {
                            signupVM.selectDate(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: SvgPicture.asset(AssetImages.dateIcon),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(AppStrings.yourMail,
                              style: Styles.expertSignupPaget1())),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextfield(
                        hintText: AppStrings.typeYourMail,
                        obscureText: false,
                        controller: signupVM.emailController.value,
                        focusNode: signupVM.emailFocusNode.value,
                        onFieldSubmitted: (p0) {
                          Utils.fieldFocusChange(
                              context,
                              signupVM.emailFocusNode.value,
                              signupVM.passwordFocusNode.value);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(AppStrings.yourPassword,
                              style: Styles.expertSignupPaget1())),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => CustomTextfield(
                          hintText: AppStrings.typePassword,
                          obscureText: signupVM.passwordVisible.value,
                          controller: signupVM.passwordController.value,
                          focusNode: signupVM.passwordFocusNode.value,
                          onFieldSubmitted: (p0) {
                            Utils.fieldFocusChange(
                                context,
                                signupVM.passwordFocusNode.value,
                                signupVM.numberFocusNode.value);
                          },
                          suffixIcon: signupVM.passwordVisible.value
                              ? GestureDetector(
                                  onTap: () {
                                    if (signupVM.passwordVisible.value) {
                                      signupVM.passwordVisible.value = false;
                                    } else {
                                      signupVM.passwordVisible.value = true;
                                    }
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.visibility),
                                  ),
                                )
                              : GestureDetector(onTap: () {
                                if (signupVM.passwordVisible.value) {
                                      signupVM.passwordVisible.value = false;
                                    } else {
                                      signupVM.passwordVisible.value = true;
                                    }
                              }, child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.visibility_off),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(AppStrings.yourNumber,
                              style: Styles.expertSignupPaget1())),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextfield(
                        hintText: AppStrings.typeNumber,
                        obscureText: false,
                        controller: signupVM.numberController.value,
                        focusNode: signupVM.numberFocusNode.value,
                        onFieldSubmitted: (p0) {},
                      ),
                    ],
                  )),
              const SizedBox(
                height: 60,
              ),
              PrimartyButton(
                title: AppStrings.createButton,
                icon: '',
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: 10,
                onTap: () {
                  signupVM.signup();
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

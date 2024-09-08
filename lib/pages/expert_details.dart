import 'dart:io';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/select_field.dart';
import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/models/expert_model.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/view_models/expert_signup_model.dart';
import 'package:dogapp/view_models/services/shared_prefence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/pic_container.dart';
import '../utils/app_colors.dart';
import '../utils/utils.dart';

class ExpertDetailsPage extends StatefulWidget {
  const ExpertDetailsPage({super.key});

  @override
  State<ExpertDetailsPage> createState() => _ExpertDetailsPageState();
}

class _ExpertDetailsPageState extends State<ExpertDetailsPage> {
  late ExpertModel expert;
  final signupVM = Get.put(ExpertSignupModel());
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    expert = await SharedPref().getExpert();
    signupVM.nameController.value = TextEditingController(text: expert.name);
    signupVM.numberController.value =
        TextEditingController(text: expert.phoneNumber);
    signupVM.dateController.value = TextEditingController(text: expert.date);
    signupVM.emailController.value = TextEditingController(text: expert.email);
    signupVM.photoUrl.value = expert.photoUrl!;
    signupVM.role.value = expert.role!;
    User userr = FirebaseAuth.instance.currentUser!;
    signupVM.uid = userr.uid;
    signupVM.passwordController.value =
        TextEditingController(text: expert.password);
    print("THis password : ${expert.password}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                AppStrings.updateProfileExpert.tr,
                style: Styles.expertSignupPageH1(),
              ),
              const SizedBox(
                height: 50,
              ),
              // Obx(
              //   () => signupVM.imageFlag.value
              //       ? const SizedBox()
              //       : SvgPicture.asset(AssetImages.expertIcon),
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PicContainer(
                      width: 86,
                      height: 86,
                      child: signupVM.photoUrl.value.isNotEmpty &&
                              signupVM.image == null
                          ? Image.network(
                              signupVM.photoUrl.value,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(signupVM.image!.path),
                              fit: BoxFit.cover,
                            ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
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
                            AppStrings.uploadYourPhoto.tr,
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
                  AppStrings.yourName.tr,
                  style: Styles.expertSignupPaget1(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => CustomTextfield(
                  hintText: AppStrings.typeYourname.tr,
                  obscureText: false,
                  isError: signupVM.nameError.value,
                  controller: signupVM.nameController.value,
                  focusNode: signupVM.nameFocusNode.value,
                  onFieldSubmitted: (p0) {
                    if (p0.isEmpty) {
                      signupVM.nameError.value = true;
                    } else {
                      signupVM.nameError.value = false;
                    }
                    Utils.fieldFocusChange(
                        context,
                        signupVM.nameFocusNode.value,
                        signupVM.dateFocusNode.value);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.dateOfBirth.tr,
                      style: Styles.expertSignupPaget1())),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => CustomTextfield(
                  hintText: AppStrings.dateFormat.tr,
                  obscureText: false,
                  isError: signupVM.dateError.value,
                  keyboardType: TextInputType.number,
                  controller: signupVM.dateController.value,
                  focusNode: signupVM.dateFocusNode.value,
                  onFieldSubmitted: (p0) {
                    if (p0.isEmpty) {
                      signupVM.dateError.value = true;
                    } else {
                      signupVM.dateError.value = false;
                    }
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
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.yourMail.tr,
                      style: Styles.expertSignupPaget1())),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => CustomTextfield(
                  hintText: AppStrings.typeYourMail.tr,
                  obscureText: false,
                  isError: signupVM.mailError.value,
                  controller: signupVM.emailController.value,
                  focusNode: signupVM.emailFocusNode.value,
                  onFieldSubmitted: (p0) {
                    if (p0.isEmpty) {
                      signupVM.mailError.value = true;
                    } else {
                      signupVM.mailError.value = false;
                    }
                    Utils.fieldFocusChange(
                        context,
                        signupVM.emailFocusNode.value,
                        signupVM.passwordFocusNode.value);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.yourPassword.tr,
                      style: Styles.expertSignupPaget1())),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => CustomTextfield(
                  hintText: AppStrings.typePassword.tr,
                  isError: signupVM.passwordError.value,
                  obscureText: signupVM.passwordVisible.value,
                  controller: signupVM.passwordController.value,
                  focusNode: signupVM.passwordFocusNode.value,
                  onFieldSubmitted: (p0) {
                    if (p0.isEmpty) {
                      signupVM.passwordError.value = true;
                    } else {
                      signupVM.passwordError.value = false;
                    }
                    Utils.fieldFocusChange(
                        context,
                        signupVM.passwordFocusNode.value,
                        signupVM.cpasswordFocusNode.value);
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
                      : GestureDetector(
                          onTap: () {
                            if (signupVM.passwordVisible.value) {
                              signupVM.passwordVisible.value = false;
                            } else {
                              signupVM.passwordVisible.value = true;
                            }
                          },
                          child: const Padding(
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
                  child: Text(AppStrings.confirmPassword.tr,
                      style: Styles.expertSignupPaget1())),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => CustomTextfield(
                  hintText: AppStrings.typePassword.tr,
                  isError: signupVM.cpasswordError.value,
                  obscureText: signupVM.cpasswordVisible.value,
                  controller: signupVM.cpasswordController.value,
                  focusNode: signupVM.cpasswordFocusNode.value,
                  onFieldSubmitted: (p0) {
                    if (p0.isEmpty) {
                      signupVM.cpasswordError.value = true;
                    } else {
                      signupVM.cpasswordError.value = false;
                    }
                    Utils.fieldFocusChange(
                        context,
                        signupVM.cpasswordFocusNode.value,
                        signupVM.numberFocusNode.value);
                  },
                  suffixIcon: signupVM.cpasswordVisible.value
                      ? GestureDetector(
                          onTap: () {
                            if (signupVM.cpasswordVisible.value) {
                              signupVM.cpasswordVisible.value = false;
                            } else {
                              signupVM.cpasswordVisible.value = true;
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.visibility),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            if (signupVM.cpasswordVisible.value) {
                              signupVM.cpasswordVisible.value = false;
                            } else {
                              signupVM.cpasswordVisible.value = true;
                            }
                          },
                          child: const Padding(
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
                  child: Text(AppStrings.yourNumber.tr,
                      style: Styles.expertSignupPaget1())),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => CustomTextfield(
                  hintText: AppStrings.typeNumber.tr,
                  obscureText: false,
                  isError: signupVM.numberError.value,
                  controller: signupVM.numberController.value,
                  focusNode: signupVM.numberFocusNode.value,
                  onFieldSubmitted: (p0) {
                    if (p0.isEmpty) {
                      signupVM.numberError.value = true;
                    } else {
                      signupVM.numberError.value = false;
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(AppStrings.expertQualification.tr,
                    style: Styles.expertSignupPaget1()),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextfield(
                hintText: AppStrings.typeQualification.tr,
                obscureText: false,
                controller: signupVM.qualificationController.value,
                focusNode: signupVM.qualificationFocusNode.value,
                onFieldSubmitted: (p0) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(AppStrings.expertSpeciality.tr,
                    style: Styles.expertSignupPaget1()),
              ),
              const SizedBox(
                height: 8,
              ),
              Obx(
                () => SelectTextfield(
                  hintText: AppStrings.typeSpeciality.tr,
                  isError: signupVM.specialityError.value,
                  val: signupVM.speciality.value,
                  items: [
                    DropdownMenuItem(
                        value: 'Training',
                        onTap: () {
                          signupVM.speciality.value = 'Training';
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.trainExpert.tr),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        )),
                    DropdownMenuItem(
                        value: 'Physiotherapists',
                        onTap: () {
                          signupVM.speciality.value = 'Physiotherapists';
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.physioExpert.tr),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        )),
                    DropdownMenuItem(
                        value: 'Nutritionists',
                        onTap: () {
                          signupVM.speciality.value = 'Nutritionists';
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.nutriExpert.tr),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        )),
                    DropdownMenuItem(
                        value: 'Veterinarians',
                        onTap: () {
                          signupVM.speciality.value = 'Veterinarians';
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.vetExpert.tr),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Obx(() => PrimartyButton(
                    icon: '',
                    loading: signupVM.loading.value,
                    title: AppStrings.createButton.tr,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 10,
                    onTap: () async {
                      await signupVM.signup();
                    },
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyAccount.tr,
                    style: const TextStyle(
                      color: AppColors.black,
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
                        AppStrings.login.tr.toUpperCase(),
                        style: const TextStyle(
                            color: AppColors.black,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
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

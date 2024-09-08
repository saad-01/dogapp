import 'dart:io';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/models/user_model.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/edit_user_model.dart';
import 'package:dogapp/view_models/services/shared_prefence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/pic_container.dart';

class EditUserDetails extends StatefulWidget {
  const EditUserDetails({super.key});

  @override
  State<EditUserDetails> createState() => _EditUserDetailsState();
}

class _EditUserDetailsState extends State<EditUserDetails> {
  late UserModel user;
  final editUserVM = Get.put(EditUserModel());
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    user = await SharedPref().getUser();
    editUserVM.nameController.value = TextEditingController(text: user.name);
    editUserVM.numberController.value =
        TextEditingController(text: user.phoneNumber);
    editUserVM.dateController.value = TextEditingController(text: user.date);
    editUserVM.emailController.value = TextEditingController(text: user.email);
    editUserVM.photoUrl.value = user.photoUrl!;
    editUserVM.role.value = user.role!;
    User userr = FirebaseAuth.instance.currentUser!;
    editUserVM.uid = userr.uid;
    editUserVM.passwordController.value =
        TextEditingController(text: user.password);
    print("THis password : ${user.password}");
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
              //   () => editUserVM.imageFlag.value
              //       ? const SizedBox()
              //       : SvgPicture.asset(AssetImages.expertIcon),
              // ),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Obx(
                        () => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PicContainer(
                              width: 86,
                              height: 86,
                              child: editUserVM.photoUrl.value.isNotEmpty &&
                                      editUserVM.image == null
                                  ? Image.network(
                                      editUserVM.photoUrl.value,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.file(
                                      File(editUserVM.image!.path),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AssetImages.addIcon),
                                const SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    editUserVM.selectImage();
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
                          isError: editUserVM.nameError.value,
                          controller: editUserVM.nameController.value,
                          focusNode: editUserVM.nameFocusNode.value,
                          onFieldSubmitted: (p0) {
                            if (p0.isEmpty) {
                              editUserVM.nameError.value = true;
                            } else {
                              editUserVM.nameError.value = false;
                            }
                            Utils.fieldFocusChange(
                                context,
                                editUserVM.nameFocusNode.value,
                                editUserVM.dateFocusNode.value);
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
                          readOnly: true,
                          isError: editUserVM.dateError.value,
                          keyboardType: TextInputType.number,
                          controller: editUserVM.dateController.value,
                          focusNode: editUserVM.dateFocusNode.value,
                          onFieldSubmitted: (p0) {
                            if (p0.isEmpty) {
                              editUserVM.dateError.value = true;
                            } else {
                              editUserVM.dateError.value = false;
                            }
                            Utils.fieldFocusChange(
                                context,
                                editUserVM.dateFocusNode.value,
                                editUserVM.emailFocusNode.value);
                          },
                          suffixIcon: GestureDetector(
                            onTap: () {
                              editUserVM.selectDate(context);
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
                          readOnly: true,
                          obscureText: false,
                          isError: editUserVM.mailError.value,
                          controller: editUserVM.emailController.value,
                          focusNode: editUserVM.emailFocusNode.value,
                          onFieldSubmitted: (p0) {
                            if (p0.isEmpty) {
                              editUserVM.mailError.value = true;
                            } else {
                              editUserVM.mailError.value = false;
                            }
                            Utils.fieldFocusChange(
                                context,
                                editUserVM.emailFocusNode.value,
                                editUserVM.passwordFocusNode.value);
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
                          readOnly: true,
                          isError: editUserVM.passwordError.value,
                          obscureText: editUserVM.passwordVisible.value,
                          controller: editUserVM.passwordController.value,
                          focusNode: editUserVM.passwordFocusNode.value,
                          onFieldSubmitted: (p0) {
                            if (p0.isEmpty) {
                              editUserVM.passwordError.value = true;
                            } else {
                              editUserVM.passwordError.value = false;
                            }
                          },
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
                          isError: editUserVM.numberError.value,
                          controller: editUserVM.numberController.value,
                          focusNode: editUserVM.numberFocusNode.value,
                          onFieldSubmitted: (p0) {
                            if (p0.isEmpty) {
                              editUserVM.numberError.value = true;
                            } else {
                              editUserVM.numberError.value = false;
                            }
                          },
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 60,
              ),
              Obx(
                () => PrimartyButton(
                  loading: editUserVM.loading.value,
                  icon: '',
                  title: AppStrings.edit.tr,
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: 10,
                  onTap: () async {
                    await editUserVM.editUserDetails();
                  },
                ),
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

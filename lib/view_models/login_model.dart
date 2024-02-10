import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginModel extends GetxController {
  final passwordController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final RxBool passwordVisible = true.obs;
  final RxBool loading = false.obs;
  final RxBool mailError = false.obs;
  final RxBool passwordError = false.obs;
  final passwordFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  Future<void> loginUser() async {
    loading.value = true;
    if (emailController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty) {
      String res = await AuthMethods().loginUser(
          email: emailController.value.text.trim(),
          password: passwordController.value.text);
      if (res == 'success') {
        loading.value = false;
      } else {
        loading.value = false;
        Utils.snackBar(AppStrings.error, AppStrings.incorrect);
      }
    } else {
      loading.value = false;
      if (emailController.value.text.isEmpty) {
        mailError.value = true;
      }
      if (passwordController.value.text.isEmpty) {
        passwordError.value = true;
      }
      if (emailController.value.text.isNotEmpty) {
        mailError.value = false;
      }
      if (passwordController.value.text.isNotEmpty) {
        passwordError.value = false;
      }
      Utils.snackBar(AppStrings.error, AppStrings.fillAll);
    }
  }
}

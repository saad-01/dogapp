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
  final passwordFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  Future<void> loginUser() async {
    loading.value = true;
    String res = await AuthMethods().loginUser(
        email: emailController.value.text,
        password: passwordController.value.text);
    if (res == 'success') {
      loading.value = true;
    } else {
      Utils.snackBar(AppStrings.error, res);
    }
  }
}

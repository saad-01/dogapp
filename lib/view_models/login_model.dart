import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/expert_model.dart' as model_ex;
import '../models/user_model.dart';
import '../routes/route_names.dart';
import 'services/shared_prefence.dart';

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
      String res = '';
      res = await AuthMethods().loginUser(
          email: emailController.value.text.trim(),
          password: passwordController.value.text);
      if (res == 'success') {
        SharedPref pref = SharedPref();
        String? uid = await pref.getUidFromSharedPreferences();
        var userSnap =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        var userData = {};
        userData = userSnap.data()!;
        var role = userData['role'];

        if (role == 'parent') {
          UserModel user = UserModel(
              photoUrl: userData['photoUrl'],
              date: userData['date'],
              role: userData['role'],
              phoneNumber: userData['phoneNumber'],
              name: userData['name'],
              id: userData['uid'],
              email: userData['email']);
          await pref.saveUser(user);
          loading.value = false;
          Get.offAllNamed(RouteName.parentDashboardPage);
        } else if (role == 'expert') {
          model_ex.ExpertModel user = model_ex.ExpertModel(
              photoUrl: userData['photoUrl'],
              date: userData['date'],
              role: userData['role'],
              phoneNumber: userData['phoneNumber'],
              name: userData['name'],
              id: userData['uid'],
              qualification: userData['qualification'],
              speciality: userData['speciality'],
              email: userData['email']);
          await pref.saveExpert(user);
          loading.value = false;
          Get.offAllNamed(RouteName.expertDashboardPage);
        }
        loading.value = false;
      } else {
        loading.value = false;
        Utils.snackBar(AppStrings.error.tr, AppStrings.incorrect.tr);
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
      Utils.snackBar(AppStrings.error.tr, AppStrings.fillAll.tr);
    }
  }
}

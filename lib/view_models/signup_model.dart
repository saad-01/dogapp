import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'services/auth_services.dart';

class ParentSignupModel extends GetxController {
  final nameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final dateController = TextEditingController().obs;
  final numberController = TextEditingController().obs;
  final RxString role = 'parent'.obs;
  final RxString photoUrl = ''.obs;
  final RxBool passwordVisible = true.obs;
  final RxBool nameError = false.obs;
  final RxBool mailError = false.obs;
  final RxBool dateError = false.obs;
  final RxBool passwordError = false.obs;
  final RxBool numberError = false.obs;
  final nameFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final dateFocusNode = FocusNode().obs;
  final numberFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  DateTime? _selectedDate;
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  RxBool imageFlag = false.obs;

  void selectImage() async {
    final XFile? im = await _picker.pickImage(source: ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    image = im;
    imageFlag.value = true;
    update();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      // Format the date using the desired format (DD.MM.YYYY)
      String formattedDate = DateFormat('dd.MM.yyyy').format(pickedDate);
      dateController.value.text = formattedDate;
    }
  }

  Future<void> signup() async {
    loading.value = true;
    String res = '';
    if (image != null) {
      res = await AuthMethods().signUpUser(
          email: emailController.value.text,
          password: passwordController.value.text,
          name: nameController.value.text,
          number: numberController.value.text,
          role: role.value,
          date: dateController.value.text,
          file: image!);
    } else {
      res = await AuthMethods().signUpUser(
        email: emailController.value.text,
        password: passwordController.value.text,
        name: nameController.value.text,
        number: numberController.value.text,
        role: role.value,
        date: dateController.value.text,
      );
    }

    if (kDebugMode) {
      print("This is $res");
    }
    if (res == "success") {
      // navigate to the home screen
      loading.value = false;
      Utils.snackBar(AppStrings.success.tr, AppStrings.loginMsg.tr);
      Get.offAllNamed(RouteName.loginPage);
    } else if (res == 'Please enter all the fields') {
      loading.value = false;
      if (nameController.value.text.isEmpty) {
        nameError.value = true;
      }
      if (dateController.value.text.isEmpty) {
        dateError.value = true;
      }
      if (emailController.value.text.isEmpty) {
        mailError.value = true;
      }
      if (passwordController.value.text.isEmpty) {
        passwordError.value = true;
      }
      if (numberController.value.text.isEmpty) {
        numberError.value = true;
      }
      if (nameController.value.text.isNotEmpty) {
        nameError.value = false;
      }
      if (dateController.value.text.isNotEmpty) {
        dateError.value = false;
      }
      if (emailController.value.text.isNotEmpty) {
        mailError.value = false;
      }
      if (passwordController.value.text.isNotEmpty) {
        passwordError.value = false;
      }
      if (numberController.value.text.isNotEmpty) {
        numberError.value = false;
      }
      Utils.snackBar(AppStrings.error.tr, AppStrings.fillAll.tr);
    } else {
      loading.value = false;
      // show the error
      Utils.snackBar(AppStrings.error.tr, res);
    }
  }
}

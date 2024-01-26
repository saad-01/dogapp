import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
      dateController.value.text = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }

  Future<void> signup() async {
    String res = await AuthMethods().signUpUser(
        email: emailController.value.text,
        password: passwordController.value.text,
        name: nameController.value.text,
        number: numberController.value.text,
        role: role.value,
        date: dateController.value.text,
        file: image!);
    print("This is $res");
    if (res == "success") {
      // navigate to the home screen
      Utils.snackBar(AppStrings.success, AppStrings.loginMsg);
      Get.offAllNamed(RouteName.loginPage);
    } else {
      // show the error
      Utils.snackBar(AppStrings.error, res);
    }
  }
}

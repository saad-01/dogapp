import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../utils/utils.dart';
import 'services/auth_services.dart';

class SelectExpertModel extends GetxController {
  final nameController = TextEditingController().obs;
  final numberController = TextEditingController().obs;
  final specialityController = TextEditingController().obs;
  final qualificationController = TextEditingController().obs;
  final RxString role = 'expert'.obs;
  String uid = '';
  final RxString photoUrl = ''.obs;
  final RxBool nameError = false.obs;
  final RxBool numberError = false.obs;
  final RxBool specialityError = false.obs;
  final nameFocusNode = FocusNode().obs;
  final numberFocusNode = FocusNode().obs;
  final specialityFocusNode = FocusNode().obs;
  final qualificationFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  XFile? image;
  RxBool imageFlag = false.obs;
  RxString speciality = ''.obs;
  final RxString name = ''.obs;
  final RxString url = ''.obs;
  final RxString expertis = ''.obs;
  final RxString id = ''.obs;
  setData(QueryDocumentSnapshot<Object?> doc) {
    name.value = doc['name'];
    url.value = doc['photoUrl'];
    id.value = doc['uid'];
    expertis.value = doc['speciality'];
  }

  setDataByMap(dynamic doc) {
    name.value = doc['name'];
    url.value = doc['photoUrl'];
    id.value = doc['uid'];
    expertis.value = doc['speciality'];
  }

  dynamic map;
  Future<void> addExpert() async {
    loading.value = true;
    String res = '';
    String id = const Uuid().v1();
    if (image != null) {
      res = await AuthMethods().addExpert(
          name: nameController.value.text,
          number: numberController.value.text,
          role: role.value,
          qualification: qualificationController.value.text,
          speciality: speciality.value,
          id: id,
          file: image!);
    } else {
      res = await AuthMethods().addExpert(
        name: nameController.value.text,
        number: numberController.value.text,
        role: role.value,
        qualification: qualificationController.value.text,
        speciality: speciality.value,
        id: id,
      );
    }

    if (kDebugMode) {
      print("This is $res");
    }
    if (res == "success") {
      // navigate to the home screen
      loading.value = false;
      // Utils.snackBar(AppStrings.success.tr, AppStrings.success.tr);
      map = {
        'name': nameController.value.text,
        'speciality': speciality.value,
        'photoUrl':
            "https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper.png",
        'uid': id,
      };
      setDataByMap(map);
      // Get.back();
      print("Name value: ${name.value}");
      Get.back();
    } else if (res == 'Please enter all the fields') {
      loading.value = false;
      if (nameController.value.text.isEmpty) {
        nameError.value = true;
      }
      if (speciality.value.isEmpty) {
        specialityError.value = true;
      }
      if (numberController.value.text.isEmpty) {
        numberError.value = true;
      }
      if (nameController.value.text.isNotEmpty) {
        nameError.value = false;
      }
      if (numberController.value.text.isNotEmpty) {
        numberError.value = false;
      }
      if (speciality.value.isNotEmpty) {
        specialityError.value = false;
      }
      Utils.snackBar(AppStrings.error.tr, AppStrings.fillAll.tr);
    } else {
      loading.value = false;
      // show the error
      Utils.snackBar(AppStrings.error.tr, res);
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNumModel extends GetxController {
  final nameController = TextEditingController().obs;
  final phoneNumController = TextEditingController().obs;
  final RxBool loading = false.obs;
  final RxBool nameError = false.obs;
  final RxBool numError = false.obs;
  final nameFocusNode = FocusNode().obs;
  final phoneNumFocusNode = FocusNode().obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addNum() async {
    try {
      loading.value = true; // Set loading to true while adding data

      // Ensure both name and phone number are not empty
      if (nameController.value.text.isEmpty ||
          phoneNumController.value.text.isEmpty) {
        loading.value = false;
        if (nameController.value.text.isEmpty) {
          nameError.value = true;
        }
        if (phoneNumController.value.text.isEmpty) {
          numError.value = true;
        }
        if (nameController.value.text.isNotEmpty) {
          nameError.value = false;
        }
        if (phoneNumController.value.text.isNotEmpty) {
          numError.value = false;
        }
        Utils.snackBar(AppStrings.error.tr, AppStrings.fillAll.tr);
      }

      // Add name and phone number to Firestore
      else {
        await _firestore.collection("emergencyNumbers").add({
          'name': nameController.value.text,
          'phone_number': phoneNumController.value.text,
        });
        loading.value = false;
        Get.back();
        Utils.snackBar(AppStrings.success.tr, AppStrings.dogAdded.tr);
      }

      // Set loading back to false after data is added
    } catch (e) {
      loading.value =
          false; // Ensure loading is set back to false in case of error
      print('Error adding data: $e');
      // Handle error, such as showing an error message to the user
    }
  }
}

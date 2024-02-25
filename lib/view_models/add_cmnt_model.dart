import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../utils/strings.dart';
import '../utils/utils.dart';

class AddCmntModel extends GetxController {
  final titleController = TextEditingController().obs;
  final cmntController = TextEditingController().obs;
  final titleFocusNode = FocusNode().obs;
  final cmntFocusNode = FocusNode().obs;
  final RxBool loading = false.obs;
  final RxBool titleError = false.obs;
  final RxBool cmntError = false.obs;
  final RxBool checkbox = false.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addCmnt(String id) async {
    String uid = const Uuid().v1();
    try {
      loading.value = true; // Set loading to true while adding data

      // Ensure both name and phone number are not empty
      if (titleController.value.text.isEmpty ||
          cmntController.value.text.isEmpty) {
        loading.value = false;
        if (titleController.value.text.isEmpty) {
          titleError.value = true;
        }
        if (cmntController.value.text.isEmpty) {
          cmntError.value = true;
        }
        if (titleController.value.text.isNotEmpty) {
          titleError.value = false;
        }
        if (cmntController.value.text.isNotEmpty) {
          cmntError.value = false;
        }
        Utils.snackBar(AppStrings.error, AppStrings.fillAll);
      } else {
        await firestore.collection("comments").doc(uid).set({
          'title': titleController.value.text,
          'id': uid,
          'comment': cmntController.value.text,
          'appointId': id,
        });
        loading.value = false;
        Get.back();
        Utils.snackBar(AppStrings.success, AppStrings.dogAdded);
      }

      // Set loading back to false after data is added
    } catch (e) {
      loading.value =
          false; // Ensure loading is set back to false in case of error
      if (kDebugMode) {
        print('Error adding data: $e');
      }
      // Handle error, such as showing an error message to the user
    }
  }
}

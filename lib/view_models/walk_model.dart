import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../utils/strings.dart';
import '../utils/utils.dart';

class WalkModel extends GetxController {
  final distanceController = TextEditingController().obs;
  final durationController = TextEditingController().obs;
  final stepsController = TextEditingController().obs;
  final distanceFocusNode = FocusNode().obs;
  final durationFocusNode = FocusNode().obs;
  final stepsFocusNode = FocusNode().obs;
  final RxBool loading = false.obs;
  final RxBool distanceError = false.obs;
  final RxBool durationError = false.obs;
  final RxBool stepsError = false.obs;
  final RxBool checkbox = false.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addWalk(String id) async {
    String uid = const Uuid().v1();
    try {
      loading.value = true; // Set loading to true while adding data

      // Ensure both name and phone number are not empty
      if (distanceController.value.text.isEmpty ||
          stepsController.value.text.isEmpty ||
          durationController.value.text.isEmpty) {
        loading.value = false;
        if (distanceController.value.text.isEmpty) {
          distanceError.value = true;
        }
        if (durationController.value.text.isEmpty) {
          durationError.value = true;
        }
        if (stepsController.value.text.isEmpty) {
          stepsError.value = true;
        }
        if (distanceController.value.text.isNotEmpty) {
          distanceError.value = false;
        }
        if (durationController.value.text.isNotEmpty) {
          durationError.value = false;
        }
        if (stepsController.value.text.isNotEmpty) {
          stepsError.value = false;
        }
        Utils.snackBar(AppStrings.error.tr, AppStrings.fillAll.tr);
      } else {
        await firestore.collection("walks").doc(uid).set({
          'distance': distanceController.value.text,
          'id': uid,
          'duration': durationController.value.text,
          'steps': stepsController.value.text,
          'dogId': id,
          'timestamp': FieldValue.serverTimestamp(),
        });
        loading.value = false;
        Get.back();
        Utils.snackBar(AppStrings.success.tr, AppStrings.dogAdded.tr);
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../utils/strings.dart';
import '../utils/utils.dart';

class DietModel extends GetxController {
  final descripController = TextEditingController().obs;
  final startController = TextEditingController().obs;
  final endController = TextEditingController().obs;
  final RxBool loading = false.obs;
  final RxBool descripError = false.obs;
  final RxBool startError = false.obs;
  final RxBool endError = false.obs;
  final descripFocusNode = FocusNode().obs;
  final startFocusNode = FocusNode().obs;
  final endFocusNode = FocusNode().obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    String formattedDate = DateFormat('dd.MM.yyyy').format(pickedDate!);
    controller.text = formattedDate;
  }

  Future<void> addPlan(String dogId, String timeTable) async {
    String id = const Uuid().v1();
    try {
      loading.value = true; // Set loading to true while adding data

      // Ensure both name and phone number are not empty
      if (descripController.value.text.isEmpty ||
          startController.value.text.isEmpty ||
          endController.value.text.isEmpty) {
        loading.value = false;
        if (descripController.value.text.isEmpty) {
          descripError.value = true;
        }
        if (startController.value.text.isEmpty) {
          startError.value = true;
        }
        if (endController.value.text.isEmpty) {
          endError.value = true;
        }
        if (descripController.value.text.isNotEmpty) {
          descripError.value = false;
        }
        if (startController.value.text.isNotEmpty) {
          startError.value = false;
        }
        if (endController.value.text.isNotEmpty) {
          endError.value = false;
        }
        Utils.snackBar(AppStrings.error.tr, AppStrings.fillAll.tr);
      } else {
        await firestore.collection("dietPlans").doc(id).set({
          'description': descripController.value.text,
          'startDate': startController.value.text,
          'endDate': endController.value.text,
          'dogId': dogId,
          'planId': id,
          'timeTable': timeTable,
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

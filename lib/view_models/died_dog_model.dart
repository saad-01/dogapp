import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/view_models/services/delete_dog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../utils/strings.dart';
import '../utils/utils.dart';

class DiedDogModel extends GetxController {
  final reasonController = TextEditingController().obs;
  final birthDateController = TextEditingController().obs;
  final notesController = TextEditingController().obs;
  final deathDateController = TextEditingController().obs;
  final RxBool loading = false.obs;
  final reasonFocusNode = FocusNode().obs;
  final birthDateFocusNode = FocusNode().obs;
  final notesFocusNode = FocusNode().obs;
  final deathDateFocusNode = FocusNode().obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
Future<void> selectDate(BuildContext context, Rx<TextEditingController> controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    String formattedDate = DateFormat('dd.MM.yyyy').format(pickedDate!);
    controller.value.text = formattedDate;
    
  }
  Future<void> addReason(String dogId) async {
    try {
      loading.value = true; // Set loading to true while adding data

      // Ensure both name and phone number are not empty
      if (reasonController.value.text.isEmpty ||
          birthDateController.value.text.isEmpty ||
          deathDateController.value.text.isEmpty) {
        loading.value = false;
        Utils.snackBar(AppStrings.error, AppStrings.fillAll);
      } else {
        await firestore.collection("dogDied").doc(dogId).set({
          'reason': reasonController.value.text,
          'birthDate': birthDateController.value.text,
          'notes': notesController.value.text,
          'deathDate': deathDateController.value.text,
          'dogId': dogId,
        });
        DeleteDog().deleteDog(dogId);
        loading.value = false;
        Get.back();
        Utils.snackBar(AppStrings.success, AppStrings.dogdeleted);
      }

      // Set loading back to false after data is added
    } catch (e) {
      loading.value =
          false; // Ensure loading is set back to false in case of error
      Utils.snackBar(AppStrings.error, e.toString());
      // Handle error, such as showing an error message to the user
    }
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/strings.dart';
import '../utils/utils.dart';

class EditFoodModel extends GetxController {
  final foodNameController = TextEditingController().obs;
  final timeController = TextEditingController().obs;
  final notesController = TextEditingController().obs;
  final reminderTimeController = TextEditingController().obs;

  final RxString day = ''.obs;
  final RxBool loading = false.obs;
  final foodNameFocusNode = FocusNode().obs;
  final timeFocusNode = FocusNode().obs;
  final notesFocusNode = FocusNode().obs;
  final reminderTimeFocusNode = FocusNode().obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var selectedTime = TimeOfDay.now().obs;
  final RxString title = ''.obs;

  Future<void> selectTime(
      BuildContext context, TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    selectedTime.value = pickedTime!;
    controller.text = selectedTime.value.format(context);
  }

  void checkTimePeriod() {
    final currentTime = selectedTime.value;

    // Define morning and evening time ranges
    const morningStart = TimeOfDay(hour: 6, minute: 0);
    const morningEnd = TimeOfDay(hour: 12, minute: 0);

    // Check if the current time falls within the morning range
    if (currentTime.hour >= morningStart.hour &&
        currentTime.hour < morningEnd.hour) {
      title.value = 'Morning food';
    } else {
      title.value = 'Evening food';
    }
  }

  Future<void> editFood(String dogId) async {
    DocumentReference docRef = firestore.collection('dogFood').doc(dogId);
    try {
      loading.value = true; // Set loading to true while adding data

      // Ensure both name and phone number are not empty
      if (foodNameController.value.text.isEmpty ||
          timeController.value.text.isEmpty ||
          reminderTimeController.value.text.isEmpty) {
        loading.value = false;
        Utils.snackBar(AppStrings.error.tr, AppStrings.fillAll.tr);
      } else {
        await docRef.update({
          'title': title.value,
          'foodName': foodNameController.value.text,
          'time': timeController.value.text,
          'notes': notesController.value.text,
          'reminderTime': reminderTimeController.value.text,
          'day': day.value,
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

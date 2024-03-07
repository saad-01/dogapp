// ignore_for_file: use_build_context_synchronously, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/strings.dart';
import '../utils/utils.dart';

class TimeTableModel extends GetxController {
  final foodNameController = TextEditingController().obs;
  final timeController = TextEditingController().obs;
  final quantityController = TextEditingController().obs;
  final caloriesController = TextEditingController().obs;
  final foodNameController2 = TextEditingController().obs;
  final timeController2 = TextEditingController().obs;
  final quantityController2 = TextEditingController().obs;
  final caloriesController2 = TextEditingController().obs;
  final foodNameController3 = TextEditingController().obs;
  final timeController3 = TextEditingController().obs;
  final quantityController3 = TextEditingController().obs;
  final caloriesController3 = TextEditingController().obs;
  final RxBool loading = false.obs;
  final RxBool nameError = false.obs;
  final RxBool timeError = false.obs;
  final RxBool quantityError = false.obs;
  final RxBool caloriesError = false.obs;
  final RxBool nameError2 = false.obs;
  final RxBool timeError2 = false.obs;
  final RxBool quantityError2 = false.obs;
  final RxBool caloriesError2 = false.obs;
  final RxBool nameError3 = false.obs;
  final RxBool timeError3 = false.obs;
  final RxBool quantityError3 = false.obs;
  final RxBool caloriesError3 = false.obs;
  final RxBool timeSet = false.obs;
  final foodNameFocusNode = FocusNode().obs;
  final timeFocusNode = FocusNode().obs;
  final quantityFocusNode = FocusNode().obs;
  final caloriesFocusNode = FocusNode().obs;
  final foodNameFocusNode2 = FocusNode().obs;
  final timeFocusNode2 = FocusNode().obs;
  final quantityFocusNode2 = FocusNode().obs;
  final caloriesFocusNode2 = FocusNode().obs;
  final foodNameFocusNode3 = FocusNode().obs;
  final timeFocusNode3 = FocusNode().obs;
  final quantityFocusNode3 = FocusNode().obs;
  final caloriesFocusNode3 = FocusNode().obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var selectedTime = TimeOfDay.now().obs;
  final RxString title = ''.obs;
  List<Map<String, dynamic>> categories=[];

  Future<void> selectTime(
      BuildContext context, TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    selectedTime.value = pickedTime!;
    controller.text = selectedTime.value.format(context);
  }

  void checkMorningTimePeriod() {
    final currentTime = selectedTime.value;

    // Define morning and evening time ranges
    const morningStart = TimeOfDay(hour: 9, minute: 0);
    const morningEnd = TimeOfDay(hour: 12, minute: 0);

    // Check if the current time falls within the morning range
    if (currentTime.hour >= morningStart.hour &&
        currentTime.hour < morningEnd.hour) {
      // Do something if the current time is in the morning range
      // For example:
    } else {
      // Show a snackbar if the current time is not in the morning range
      Utils.snackBar(AppStrings.error, AppStrings.selectRightTime);
    }
  }

  void checkMidTimePeriod() {
    final currentTime = selectedTime.value;

    // Define morning and evening time ranges
    const morningStart = TimeOfDay(hour: 12, minute: 0);
    const morningEnd = TimeOfDay(hour: 18, minute: 0);

    // Check if the current time falls within the morning range
    if (currentTime.hour >= morningStart.hour &&
        currentTime.hour < morningEnd.hour) {
    } else {
      Utils.snackBar(AppStrings.error, AppStrings.selectRightTime);
    }
  }

  void checkEveningTimePeriod() {
    final currentTime = selectedTime.value;

    // Define morning and evening time ranges
    const morningStart = TimeOfDay(hour: 18, minute: 0);
    const morningEnd = TimeOfDay(hour: 24, minute: 0);

    // Check if the current time falls within the morning range
    if (currentTime.hour >= morningStart.hour &&
        currentTime.hour < morningEnd.hour) {
    } else {
      Utils.snackBar(AppStrings.error, AppStrings.selectRightTime);
    }
  }

  Future<void> timeTable() async {
    try {
      loading.value = true; // Set loading to true while adding data
      if (foodNameController2.value.text.isNotEmpty) {
        if (quantityController2.value.text.isEmpty ||
            timeController2.value.text.isEmpty ||
            caloriesController2.value.text.isEmpty) {
          loading.value = false;
          if (quantityController2.value.text.isEmpty) {
            quantityError2.value = true;
          }
          if (timeController2.value.text.isEmpty) {
            timeError2.value = true;
          }
          if (caloriesController2.value.text.isEmpty) {
            caloriesError2.value = true;
          }
          if (quantityController2.value.text.isNotEmpty) {
            quantityError2.value = false;
          }
          if (timeController2.value.text.isNotEmpty) {
            timeError2.value = false;
          }
          if (caloriesController2.value.text.isNotEmpty) {
            caloriesError2.value = false;
          }
          Utils.snackBar(AppStrings.error, AppStrings.fillAll);
        }
      }
      if (foodNameController3.value.text.isNotEmpty) {
        if (quantityController3.value.text.isEmpty ||
            timeController3.value.text.isEmpty ||
            caloriesController3.value.text.isEmpty) {
          loading.value = false;
          if (quantityController3.value.text.isEmpty) {
            quantityError3.value = true;
          }
          if (timeController3.value.text.isEmpty) {
            timeError3.value = true;
          }
          if (caloriesController3.value.text.isEmpty) {
            caloriesError3.value = true;
          }
          if (quantityController3.value.text.isNotEmpty) {
            quantityError3.value = false;
          }
          if (timeController3.value.text.isNotEmpty) {
            timeError3.value = false;
          }
          if (caloriesController3.value.text.isNotEmpty) {
            caloriesError3.value = false;
          }
          Utils.snackBar(AppStrings.error, AppStrings.fillAll);
        }
      }
      // Ensure both name and phone number are not empty
      if (foodNameController.value.text.isNotEmpty) {
        if (quantityController.value.text.isEmpty ||
            timeController.value.text.isEmpty ||
            caloriesController.value.text.isEmpty) {
          loading.value = false;
          if (quantityController.value.text.isEmpty) {
            quantityError.value = true;
          }
          if (timeController.value.text.isEmpty) {
            timeError.value = true;
          }
          if (caloriesController.value.text.isEmpty) {
            caloriesError.value = true;
          }
          if (quantityController.value.text.isNotEmpty) {
            quantityError.value = false;
          }
          if (timeController.value.text.isNotEmpty) {
            timeError.value = false;
          }
          if (caloriesController.value.text.isNotEmpty) {
            caloriesError.value = false;
          }
          Utils.snackBar(AppStrings.error, AppStrings.fillAll);
        }
      }
      if (foodNameController.value.text.isEmpty &&
          foodNameController2.value.text.isEmpty &&
          foodNameController3.value.text.isEmpty) {
        loading.value = false;
        Utils.snackBar(AppStrings.error, AppStrings.fillAll);
      } else {
        // await firestore.collection("dogFood").doc(id).set({
        //   'title': title.value,
        //   'foodName': foodNameController.value.text,
        //   'time': timeController.value.text,
        //   'notes': notesController.value.text,
        //   'reminderTime': reminderTimeController.value.text,
        //   'day': day.value,
        //   'dogId': dogId,
        //   'foodId': id,
        // });
        loading.value = false;
        timeSet.value = true;
        categories = [
          {
            'name': 'Morning',
            'foods': [
              {
                'foodName': foodNameController.value.text,
                'quantity': quantityController.value.text,
                'calories': caloriesController.value.text,
                'time': timeController.value.text,
              },
              // Add more foods for morning category if needed
            ],
          },
          {
            'name': 'Midday',
            'foods': [
              {
                'foodName': foodNameController2.value.text,
                'quantity': quantityController2.value.text,
                'calories': caloriesController2.value.text,
                'time': timeController2.value.text,
              },
              // Add more foods for midday category if needed
            ],
          },
          {
            'name': 'Evening',
            'foods': [
              {
                'foodName': foodNameController3.value.text,
                'quantity': quantityController3.value.text,
                'calories': caloriesController3.value.text,
                'time': timeController3.value.text,
              },
              // Add more foods for evening category if needed
            ],
          },
          // Add more categories if needed
        ];
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

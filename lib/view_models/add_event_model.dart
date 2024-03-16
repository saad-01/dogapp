// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../utils/strings.dart';
import '../utils/utils.dart';

class AddEventModel extends GetxController {
  final titleController = TextEditingController().obs;
  final subTitleController = TextEditingController().obs;
  final timeController = TextEditingController().obs;
  final dateController = TextEditingController().obs;
  final locationController = TextEditingController().obs;
  final RxBool loading = false.obs;
  final RxBool titleError = false.obs;
  final RxBool subTitleError = false.obs;
  final RxBool timeError = false.obs;
  final RxBool dateError = false.obs;
  final RxBool locationError = false.obs;
  final titleFocusNode = FocusNode().obs;
  final subTitleFocusNode = FocusNode().obs;
  final timeFocusNode = FocusNode().obs;
  final dateFocusNode = FocusNode().obs;
  final locationFocusNode = FocusNode().obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  DateTime? _selectedDate;

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

  Future<void> addEvent() async {
    String id = const Uuid().v1();
    try {
      loading.value = true; // Set loading to true while adding data
      // Ensure both name and phone number are not empty
      if (titleController.value.text.isEmpty ||
          timeController.value.text.isEmpty ||
          subTitleController.value.text.isEmpty ||
          dateController.value.text.isEmpty ||
          locationController.value.text.isEmpty) {
        loading.value = false;
        if (titleController.value.text.isEmpty) {
          titleError.value = true;
        }
        if (subTitleController.value.text.isEmpty) {
          subTitleError.value = true;
        }
        if (timeController.value.text.isEmpty) {
          timeError.value = true;
        }
        if (dateController.value.text.isEmpty) {
          dateError.value = true;
        }
        if (locationController.value.text.isEmpty) {
          locationError.value = true;
        }
        if (titleController.value.text.isNotEmpty) {
          titleError.value = false;
        }
        if (subTitleController.value.text.isNotEmpty) {
          subTitleError.value = false;
        }
        if (dateController.value.text.isNotEmpty) {
          dateError.value = false;
        }
        if (locationController.value.text.isNotEmpty) {
          locationError.value = false;
        }
        if (timeController.value.text.isNotEmpty) {
          timeError.value = false;
        }
        Utils.snackBar(AppStrings.error.tr, AppStrings.fillAll.tr);
      } else {
        await firestore.collection("events").doc(id).set({
          'title': titleController.value.text,
          'subtitle': subTitleController.value.text,
          'time': timeController.value.text,
          'date': dateController.value.text,
          'location': locationController.value.text,
          'id': id,
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

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReminderModel extends GetxController{
  final timeController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final nameFocusNode = FocusNode().obs;
  final timeFocusNode = FocusNode().obs;
  final RxString repeat = 'Once'.obs;
  final RxBool loading = false.obs;
  final RxBool nameError = false.obs;
  final RxBool timeError = false.obs;
  var selectedTime = TimeOfDay.now().obs;
  Future<void> selectTime(
      BuildContext context, TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    selectedTime.value = pickedTime!;
    controller.text = selectedTime.value.format(context);
  }

}
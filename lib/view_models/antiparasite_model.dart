// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../utils/strings.dart';
import '../utils/utils.dart';
import 'services/storage_services.dart';

class AnitParasiteModel extends GetxController {
  final RxBool reasonError = false.obs;
  DateTime? _selectedDate;
  final dateController = TextEditingController().obs;
  final timeController = TextEditingController().obs;
  final notesController = TextEditingController().obs;
  final reasonController = TextEditingController().obs;
  final reminderTimeController = TextEditingController().obs;
  final reminderDateController = TextEditingController().obs;
  final dateFocusNode = FocusNode().obs;
  final notesFocusNode = FocusNode().obs;
  final reminderTimeFocusNode = FocusNode().obs;
  final reminderDateFocusNode = FocusNode().obs;
  final reasonFocusNode = FocusNode().obs;
  final RxBool dateError = false.obs;
  final RxBool loading = false.obs;
  final RxBool timeError = false.obs;
  final RxBool typeError = false.obs;
  final RxBool expertError = false.obs;
  final RxString expertId = ''.obs;
  final RxString dogId = ''.obs;
  final timeFocusNode = FocusNode().obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var selectedTime = TimeOfDay.now().obs;
  List<File> files = [];
  List<XFile> photos = [];
  List<String> urls = [];
  RxBool multiImageFlag = false.obs;
  RxBool multiFileFlag = false.obs;

  Future<List<XFile>> pickMultipleImages() async {
    List<XFile>? images = await ImagePicker().pickMultiImage();

    if (images.isNotEmpty) {
      photos.addAll(images);
      multiImageFlag.value = true;
    }

    return photos;
  }

  Future<List<File>> pickMultipleFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom, // Specify the file types you want to allow
      allowedExtensions: [
        'pdf',
        'doc',
        'docx',
        'txt'
      ], // Example: Allow PDFs, Word documents, and text files
    );

    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
      multiFileFlag.value = true;
    }

    return files;
  }

  Future<void> uploadFiles(String uid) async {
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      for (var file in files) {
        // String fileName = file.path.split('/').last;
        String id = const Uuid().v1();
        Reference ref =
            storage.ref().child('appointments').child(uid).child(id);
        UploadTask uploadTask = ref.putFile(file);
        TaskSnapshot snapshot =
            await uploadTask.whenComplete(() => print('Upload complete'));
        // Get the download URL once the upload is complete
        if (snapshot.state == TaskState.success) {
          print('Upload successful');
          String downloadUrl = await snapshot.ref.getDownloadURL();
          print('Download URL: $downloadUrl');
          urls.add(downloadUrl); // Add the download URL to the list
        } else {
          print('Upload failed');
        }
      }
    } catch (e) {
      print('Error uploading files: $e');
    }
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
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
      controller.text = formattedDate;
    }
  }

  Future<void> selectTime(
      BuildContext context, TextEditingController controller) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    selectedTime.value = pickedTime!;
    controller.text = selectedTime.value.format(context);
  }

  Future<void> addVaccination() async {
    String id = const Uuid().v1();

    try {
      loading.value = true;
      if (expertId.value.isEmpty ||
          dateController.value.text.isEmpty ||
          timeController.value.text.isEmpty ||
          reasonController.value.text.isEmpty) {
        loading.value = false;
        if (dateController.value.text.isEmpty) {
          dateError.value = true;
        }
        if (reasonController.value.text.isEmpty) {
          reasonError.value = true;
        }
        if (timeController.value.text.isEmpty) {
          timeError.value = true;
        }
        if (expertId.value.isEmpty) {
          expertError.value = true;
        }
        if (expertId.value.isNotEmpty) {
          expertError.value = false;
        }
        if (reasonController.value.text.isNotEmpty) {
          reasonError.value = false;
        }
        if (dateController.value.text.isNotEmpty) {
          dateError.value = false;
        }
        if (timeController.value.text.isNotEmpty) {
          timeError.value = false;
        }
        Utils.snackBar(AppStrings.error, AppStrings.fillAll);
      } else {
        if (multiImageFlag.value) {
          List<String> urlsList =
              await StorageMethods().uploadPhotos(photos, id, 'appointments');
          for (var url in urlsList) {
            urls.add(url);
          }
        }
        if (multiFileFlag.value) {
          uploadFiles(id);
        }
        await firestore.collection("appointments").doc(id).set({
          'reminderDate': reminderDateController.value.text,
          'type': 'antiparasite',
          'status': 'Requested',
          'reason': reasonController.value.text,
          'date': dateController.value.text,
          'time': timeController.value.text,
          'notes': notesController.value.text,
          'reminderTime': reminderTimeController.value.text,
          'expertId': expertId.value,
          'parentId': FirebaseAuth.instance.currentUser!.uid,
          'dogId': dogId.value,
          'id': id,
          'vaccinationType': '',
          'releaseFlag': false,
          'urls': jsonEncode(urls),
        });
        loading.value = false;
        Get.back();
        Utils.snackBar(AppStrings.success, AppStrings.dogAdded);
      }
    } catch (e) {
      loading.value = false;
    }
  }
}

import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/services/storage_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class AddTrainingModel extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final titleController = TextEditingController().obs;
  final noteController = TextEditingController().obs;
  final lengthController = TextEditingController().obs;
  final equipmentController = TextEditingController().obs;
  final eligiblilityController = TextEditingController().obs;
  final descriptionController = TextEditingController().obs;

  final titleFocusNode = FocusNode().obs;
  final noteFocusNode = FocusNode().obs;
  final lengthFocusNode = FocusNode().obs;
  final equipmentFocusNode = FocusNode().obs;
  final eligibilityFocusNode = FocusNode().obs;
  final descriptionFocusNode = FocusNode().obs;

  final RxString category = ''.obs;
  final RxString subCategory = 'dayByDay'.obs;
  final RxString level = ''.obs;

  RxBool categoryError = false.obs;
  RxBool levelError = false.obs;
  RxBool loading = false.obs;
  RxBool titleError = false.obs;
  RxBool lengthError = false.obs;
  RxBool desError = false.obs;
  RxBool eligibleError = false.obs;
  RxBool equipmentError = false.obs;

  RxBool multiImageFlag = false.obs;
  RxBool multiFileFlag = false.obs;

  List<List<String>> urls = [];
  List<File> files = [];
  List<XFile> photos = [];
  final textFields = <TextEditingController>[].obs;

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
        Reference ref = storage.ref().child('trainings').child(uid).child(id);
        UploadTask uploadTask = ref.putFile(file);
        TaskSnapshot snapshot =
            await uploadTask.whenComplete(() => print('Upload complete'));
        // Get the download URL once the upload is complete
        if (snapshot.state == TaskState.success) {
          print('Upload successful');
          String downloadUrl = await snapshot.ref.getDownloadURL();
          print('Download URL: $downloadUrl');
          urls.add([downloadUrl, 'file']); // Add the download URL to the list
        } else {
          print('Upload failed');
        }
      }
    } catch (e) {
      print('Error uploading files: $e');
    }
  }

  Future<void> addTraining(String dogId) async {
    String id = const Uuid().v1();

    try {
      loading.value = true; // Set loading to true while adding data

      if (subCategory.value == 'general') {
        if (titleController.value.text.isEmpty ||
            lengthController.value.text.isEmpty ||
            equipmentController.value.text.isEmpty ||
            descriptionController.value.text.isEmpty ||
            eligiblilityController.value.text.isEmpty ||
            category.value.isEmpty ||
            level.value.isEmpty) {
          loading.value = false;
          if (titleController.value.text.isEmpty) {
            titleError.value = true;
          }
          if (lengthController.value.text.isEmpty) {
            lengthError.value = true;
          }
          if (equipmentController.value.text.isEmpty) {
            equipmentError.value = true;
          }

          if (eligiblilityController.value.text.isEmpty) {
            eligibleError.value = true;
          }
          if (category.value.isEmpty) {
            categoryError.value = true;
          }
          if (level.value.isEmpty) {
            levelError.value = true;
          }
          if (descriptionController.value.text.isEmpty) {
            desError.value = true;
          }
          if (descriptionController.value.text.isNotEmpty) {
            desError.value = false;
          }
          if (titleController.value.text.isNotEmpty) {
            titleError.value = false;
          }
          if (lengthController.value.text.isNotEmpty) {
            lengthError.value = false;
          }
          if (equipmentController.value.text.isNotEmpty) {
            equipmentError.value = false;
          }

          if (eligiblilityController.value.text.isNotEmpty) {
            eligibleError.value = false;
          }
          if (category.value.isNotEmpty) {
            categoryError.value = false;
          }
          if (level.value.isNotEmpty) {
            levelError.value = false;
          }
          Utils.snackBar(AppStrings.error.tr, AppStrings.fillAll.tr);
        } else {
          if (multiImageFlag.value) {
            List<String> urlsList =
                await StorageMethods().uploadPhotos(photos, id, 'trainings');
            for (var url in urlsList) {
              urls.add([url, 'image']);
            }
            if (kDebugMode) {
              print("Image upload complete");
            }
          }
          if (multiFileFlag.value) {
            await uploadFiles(id);
            if (kDebugMode) {
              print("File upload complete");
            }
          }
          await firestore.collection("trainings").doc(id).set({
            'title': titleController.value.text,
            'note': noteController.value.text,
            'length': lengthController.value.text,
            'equipment': equipmentController.value.text,
            'level': level.value,
            'dogId': dogId,
            'eligibility': eligiblilityController.value.text,
            'category': category.value,
            'subcategory': subCategory.value,
            'description': descriptionController.value.text,
            'urls': jsonEncode(urls),
            'id': id,
          });
          loading.value = false;
          Get.back();
          Utils.snackBar(AppStrings.success.tr, AppStrings.dogAdded.tr);
        }
      } else {}

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

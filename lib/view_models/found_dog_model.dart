import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/view_models/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/founded_dog_model.dart';
import '../utils/strings.dart';
import '../utils/utils.dart';
import 'services/shared_prefence.dart';

class FoundDogModel extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final yourNameController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final phoneNumController = TextEditingController().obs;
  final notesController = TextEditingController().obs;
  final dateController = TextEditingController().obs;
  final microchipNumberController = TextEditingController().obs;

  final dateFocusNode = FocusNode().obs;
  final notesFocusNode = FocusNode().obs;
  final yourNameFocusNode = FocusNode().obs;
  final addressFocusNode = FocusNode().obs;
  final phoneNumFocusNode = FocusNode().obs;
  final microchipNumberFocusNode = FocusNode().obs;

  final RxString photoUrl = ''.obs;
  final RxString gender = ''.obs;
  RxBool loading = false.obs;
  RxBool checkbox = false.obs;
  RxBool nameError = false.obs;
  RxBool addressError = false.obs;
  RxBool numberError = false.obs;
  RxBool colorError = false.obs;
  RxBool dateError = false.obs;

  RxList<Color> selectedColors = <Color>[].obs;

  DateTime? _selectedDate;
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  RxBool imageFlag = false.obs;
  RxBool multiImageFlag = false.obs;

  List<XFile> photos = [];

  void selectImage() async {
    final XFile? im = await _picker.pickImage(source: ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    image = im;
    imageFlag.value = true;
    update();
  }

  Future<List<XFile>> pickMultipleImages() async {
    List<XFile>? images = await ImagePicker().pickMultiImage();

    photos.addAll(images);
    multiImageFlag.value = true;
    return photos;
  }

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

  void addColor(Color color) {
    selectedColors.add(color);
  }

  void removeColor(int index) {
    selectedColors.removeAt(index);
  }

  Future<void> createDog() async {
    loading.value = true;
    List<String> colorHexList =
        selectedColors.map((color) => color.value.toRadixString(16)).toList();
    SharedPref pref = SharedPref();
    String? uid = await pref.getUidFromSharedPreferences();
    String res = '';
    if (image != null) {
      res = await addDog(
          date: dateController.value.text,
          microChipNumber: microchipNumberController.value.text,
          gender: gender.value,
          colors: colorHexList,
          photos: photos,
          yourName: yourNameController.value.text,
          phoneNum: phoneNumController.value.text,
          address: addressController.value.text,
          notes: notesController.value.text,
          uid: uid!,
          file: image!);
    } else {
      loading.value = false;
      if (yourNameController.value.text.isNotEmpty) {
        nameError.value = false;
      }
      if (yourNameController.value.text.isEmpty) {
        nameError.value = true;
      }
      if (addressController.value.text.isEmpty) {
        addressError.value = true;
      }
      if (addressController.value.text.isNotEmpty) {
        addressError.value = false;
      }
      if (phoneNumController.value.text.isNotEmpty) {
        numberError.value = false;
      }
      if (phoneNumController.value.text.isEmpty) {
        numberError.value = true;
      }
      if (selectedColors.isEmpty) {
        colorError.value = true;
      }
      if (selectedColors.isNotEmpty) {
        colorError.value = false;
      }
      if (dateController.value.text.isEmpty) {
        dateError.value = true;
      }
      if (dateController.value.text.isNotEmpty) {
        dateError.value = false;
      }
      Utils.snackBar(AppStrings.error.tr, AppStrings.fillAll.tr);
    }
    if (res == "success") {
      loading.value = false;
      Get.back();
      Utils.snackBar(AppStrings.success.tr, AppStrings.dogAdded.tr);
    } else if (res == "Please enter all the fields") {
      loading.value = false;
      if (yourNameController.value.text.isNotEmpty) {
        nameError.value = false;
      }
      if (yourNameController.value.text.isEmpty) {
        nameError.value = true;
      }
      if (addressController.value.text.isEmpty) {
        addressError.value = true;
      }
      if (addressController.value.text.isNotEmpty) {
        addressError.value = false;
      }
      if (phoneNumController.value.text.isNotEmpty) {
        numberError.value = false;
      }
      if (phoneNumController.value.text.isEmpty) {
        numberError.value = true;
      }
      if (selectedColors.isEmpty) {
        colorError.value = true;
      }
      if (selectedColors.isNotEmpty) {
        colorError.value = false;
      }
      if (dateController.value.text.isEmpty) {
        dateError.value = true;
      }
      if (dateController.value.text.isNotEmpty) {
        dateError.value = false;
      }
      Utils.snackBar(AppStrings.error.tr, AppStrings.fillAll.tr);
    } else if (res.isNotEmpty) {
      // show the error
      loading.value = false;
      Utils.snackBar(AppStrings.error.tr, res);
    }
  }

  Future<String> addDog({
    required String date,
    required String microChipNumber,
    required String gender,
    required String yourName,
    required String address,
    required String phoneNum,
    required String? notes,
    required List<String> colors,
    required List<XFile> photos,
    required String uid,
    required XFile file,
  }) async {
    String res = "Some error Occurred";
    try {
      List<String> urls = [];
      if (date.isNotEmpty &&
          colors.isNotEmpty &&
          yourName.isNotEmpty &&
          address.isNotEmpty &&
          phoneNum.isNotEmpty &&
          imageFlag.value) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('foundedDogPics', file, true);
        if (multiImageFlag.value) {
          urls = await StorageMethods()
              .uploadPhotos(photos, uid, 'foundedDogPics');
        }
        String dogId = const Uuid().v1();

        FoundedDogModel dog = FoundedDogModel(
          foundDate: date,
          gender: gender,
          colors: jsonEncode(colors),
          yourName: yourName,
          phoneNum: phoneNum,
          address: address,
          notes: notes,
          photoUrl: photoUrl,
          uid: uid,
          dogId: dogId,
          microchipNumber: microChipNumber,
          urls: jsonEncode(urls),
        );

        // adding user in our database
        await _firestore.collection("foundedDogs").doc(dogId).set(dog.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}

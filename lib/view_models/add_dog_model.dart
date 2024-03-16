import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/view_models/services/shared_prefence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../models/dog_model.dart';
import '../utils/strings.dart';
import '../utils/utils.dart';
import 'services/storage_services.dart';

class AddDogModel extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final nameController = TextEditingController().obs;
  final weightController = TextEditingController().obs;
  final dateController = TextEditingController().obs;
  final microchipNumberController = TextEditingController().obs;

  final nameFocusNode = FocusNode().obs;
  final weightFocusNode = FocusNode().obs;
  final dateFocusNode = FocusNode().obs;
  final microchipNumberFocusNode = FocusNode().obs;

  final RxString photoUrl = ''.obs;
  final RxString breed = ''.obs;
  final RxString gender = ''.obs;
  final RxString neutered = ''.obs;
  final RxBool passwordVisible = true.obs;

  RxBool genderError = false.obs;
  RxBool neuteredError = false.obs;
  RxBool breedError = false.obs;
  RxBool loading = false.obs;
  RxBool nameError = false.obs;
  RxBool dateError = false.obs;

  RxList<Color> selectedColors = <Color>[].obs;

  DateTime? _selectedDate;
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  RxBool imageFlag = false.obs;

  void selectImage() async {
    final XFile? im = await _picker.pickImage(source: ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    image = im;
    imageFlag.value = true;
    update();
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
          name: nameController.value.text,
          date: dateController.value.text,
          weight: weightController.value.text,
          breed: breed.value,
          microChipNumber: microchipNumberController.value.text,
          gender: gender.value,
          neutered: neutered.value,
          colors: colorHexList,
          uid: uid!,
          file: image);
    } else {
      res = await addDog(
        name: nameController.value.text,
        date: dateController.value.text,
        weight: weightController.value.text,
        breed: breed.value,
        microChipNumber: microchipNumberController.value.text,
        gender: gender.value,
        neutered: neutered.value,
        colors: colorHexList,
        uid: uid!,
      );
    }

    if (res == "success") {
      loading.value = false;
      Get.back();
      Utils.snackBar(AppStrings.success.tr, AppStrings.dogAdded.tr);
    } else if (res == "Please enter all the fields") {
      loading.value = false;
      if (nameController.value.text.isEmpty) {
        nameError.value = true;
      }
      if (dateController.value.text.isEmpty) {
        dateError.value = true;
      }
      if (gender.isEmpty) {
        genderError.value = true;
      }
      if (neutered.value.isEmpty) {
        neuteredError.value = true;
      }
      if (breed.value.isEmpty) {
        breedError.value = true;
      }
      if (nameController.value.text.isNotEmpty) {
        nameError.value = false;
      }
      if (dateController.value.text.isNotEmpty) {
        dateError.value = false;
      }
      if (gender.isNotEmpty) {
        genderError.value = false;
      }
      if (neutered.value.isNotEmpty) {
        neuteredError.value = false;
      }
      if (breed.value.isNotEmpty) {
        breedError.value = false;
      }
      Utils.snackBar(AppStrings.error.tr, AppStrings.fillAll.tr);
    } else {
      // show the error
      loading.value = false;
      Utils.snackBar(AppStrings.error.tr, res);
    }
  }

  Future<String> addDog({
    required String name,
    required String date,
    required String weight,
    required String breed,
    required String microChipNumber,
    required String gender,
    required String neutered,
    required List<String> colors,
    required String uid,
    XFile? file,
  }) async {
    String res = "Some error Occurred";
    try {
      loading.value = true;
      String photoUrl = '';
      if (file != null) {
        photoUrl = await StorageMethods()
            .uploadImageToStorage('dogProfilePics', file, true);
      } else {
        photoUrl =
            'https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper.png';
      }
      if (name.isNotEmpty &&
          date.isNotEmpty &&
          gender.isNotEmpty &&
          neutered.isNotEmpty &&
          breed.isNotEmpty) {
        String dogId = const Uuid().v1();

        DogModel dog = DogModel(
            name: name,
            uid: uid,
            photoUrl: photoUrl,
            weight: weight,
            date: date,
            microchipNumber: microChipNumber,
            breed: breed,
            colors: jsonEncode(colors),
            neutered: neutered,
            gender: gender,
            dogId: dogId);

        // adding user in our database
        await _firestore.collection("dogs").doc(dogId).set(dog.toJson());

        res = "success";
      } else {
        loading.value = false;
        res = "Please enter all the fields";
      }
    } catch (err) {
      loading.value = false;
      return err.toString();
    }
    return res;
  }
}

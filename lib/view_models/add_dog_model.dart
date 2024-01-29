import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/view_models/services/shared_prefence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
  RxBool loading = false.obs;

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
      dateController.value.text = "${pickedDate.toLocal()}".split(' ')[0];
    }
  }

  void addColor(Color color) {
    selectedColors.add(color);
  }

  void removeColor(int index) {
    selectedColors.removeAt(index);
  }

  Future<String> createDog() async {
    List<String> colorHexList =
        selectedColors.map((color) => color.value.toRadixString(16)).toList();
    SharedPref pref = SharedPref();
    String? uid = await pref.getUidFromSharedPreferences();
    String res = await addDog(
        name: nameController.value.text,
        date: dateController.value.text,
        weight: weightController.value.text,
        breed: breed.value,
        microChipNumber: microchipNumberController.value.text,
        gender: gender.value,
        neutered: neutered.value,
        colors: colorHexList,
        uid: uid!,
        file: image!);
    if (res == "success") {
      Get.back();
      Utils.snackBar(AppStrings.success, AppStrings.dogAdded);
      return res;
    } else {
      // show the error
      Utils.snackBar(AppStrings.error, res);
      return res;
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
    required XFile file,
  }) async {
    String res = "Some error Occurred";
    try {
      loading.value = true;
      String photoUrl = await StorageMethods()
          .uploadImageToStorage('dogProfilePics', file, true);
      if (name.isNotEmpty ||
          microChipNumber.isNotEmpty ||
          weight.isNotEmpty ||
          date.isNotEmpty ||
          gender.isNotEmpty ||
          neutered.isNotEmpty ||
          breed.isNotEmpty ||
          colors.isNotEmpty ||
          photoUrl == '') {
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

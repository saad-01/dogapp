import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/view_models/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../models/missing_dog_model.dart';
import '../utils/strings.dart';
import '../utils/utils.dart';
import 'services/shared_prefence.dart';

class MissDogModel extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final nameController = TextEditingController().obs;
  final yourNameController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final phoneNumController = TextEditingController().obs;
  final notesController = TextEditingController().obs;
  final ageController = TextEditingController().obs;
  final weightController = TextEditingController().obs;
  final dateController = TextEditingController().obs;
  final microchipNumberController = TextEditingController().obs;

  final nameFocusNode = FocusNode().obs;
  final ageFocusNode = FocusNode().obs;
  final weightFocusNode = FocusNode().obs;
  final dateFocusNode = FocusNode().obs;
  final notesFocusNode = FocusNode().obs;
  final yourNameFocusNode = FocusNode().obs;
  final addressFocusNode = FocusNode().obs;
  final phoneNumFocusNode = FocusNode().obs;
  final microchipNumberFocusNode = FocusNode().obs;

  final RxString photoUrl = ''.obs;
  final RxString breed = ''.obs;
  final RxString gender = ''.obs;
  RxBool loading = false.obs;
  RxBool checkbox = false.obs;

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
    loading.value = true;
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
        age: ageController.value.text,
        colors: colorHexList,
        photos: photos,
        yourName: yourNameController.value.text,
        phoneNum: phoneNumController.value.text,
        address: addressController.value.text,
        notes: notesController.value.text,
        uid: uid!,
        file: image!);
    if (res == "success") {
      loading.value = false;
      Get.back();
      Utils.snackBar(AppStrings.success, AppStrings.dogAdded);
      return res;
    } else {
      // show the error
      loading.value = false;
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
    required String age,
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
      if (name.isNotEmpty ||
          microChipNumber.isNotEmpty ||
          weight.isNotEmpty ||
          date.isNotEmpty ||
          gender.isNotEmpty ||
          age.isNotEmpty ||
          breed.isNotEmpty ||
          colors.isNotEmpty ||
          yourName.isNotEmpty ||
          address.isNotEmpty ||
          phoneNum.isNotEmpty ||
          imageFlag.value) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('missDogPics', file, true);
        if (multiImageFlag.value) {
          urls = await StorageMethods().uploadPhotos(photos, uid,'missDogPics');
        }
        String dogId = const Uuid().v1();

        MissingDogModel dog = MissingDogModel(
          name: name,
          lostDate: date,
          weight: weight,
          gender: gender,
          colors: jsonEncode(colors),
          yourName: yourName,
          phoneNum: phoneNum,
          address: address,
          notes: notes,
          age: age,
          photoUrl: photoUrl,
          breed: breed,
          uid: uid,
          dogId: dogId,
          microchipNumber: microChipNumber,
          urls: jsonEncode(urls),
        );

        // adding user in our database
        await _firestore.collection("missingDogs").doc(dogId).set(dog.toJson());

        res = "success";
      } else {
        res = AppStrings.fillAll;
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}

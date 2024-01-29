import 'dart:io';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/select_field.dart';
import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/add_dog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../view_models/breeds.dart';

class AddDogPage extends StatefulWidget {
  const AddDogPage({super.key});

  @override
  State<AddDogPage> createState() => _AddDogPageState();
}

class _AddDogPageState extends State<AddDogPage> {
  Color? selectedColor;
  @override
  Widget build(BuildContext context) {
    // String selectedOption = '';
    final addDogVM = Get.put(AddDogModel());
    final breedsVM = Get.put(Breeds());
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                AppStrings.setProfile,
                style: Styles.expertSignupPageH1(),
              ),
              const SizedBox(
                height: 50,
              ),
              Obx(
                () => addDogVM.imageFlag.value
                    ? const SizedBox()
                    : SvgPicture.asset(AssetImages.uploadDog),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    addDogVM.imageFlag.value
                        ? Container(
                            width: 100,
                            height: 100,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1.50, color: AppColors.primaryColor),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Image.file(
                              File(addDogVM.image!.path),
                              fit: BoxFit.cover,
                            ),
                          )
                        : Row(
                            children: [
                              SvgPicture.asset(AssetImages.addIcon),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  addDogVM.selectImage();
                                },
                                child: Text(
                                  AppStrings.uploadDog,
                                  style: Styles.expertSignupPageH2(),
                                ),
                              )
                            ],
                          ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.dogsName,
                          style: Styles.expertSignupPaget1(),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextfield(
                        hintText: AppStrings.typeDogName,
                        obscureText: false,
                        controller: addDogVM.nameController.value,
                        focusNode: addDogVM.nameFocusNode.value,
                        onFieldSubmitted: (p0) {
                          Utils.fieldFocusChange(
                              context,
                              addDogVM.nameFocusNode.value,
                              addDogVM.dateFocusNode.value);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(AppStrings.dateOfBirth,
                              style: Styles.expertSignupPaget1())),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => CustomTextfield(
                          hintText: addDogVM.dateController.value.text == ''
                              ? AppStrings.dateFormat
                              : addDogVM.dateController.value.text,
                          obscureText: false,
                          keyboardType: TextInputType.none,
                          controller: addDogVM.dateController.value,
                          focusNode: addDogVM.dateFocusNode.value,
                          onFieldSubmitted: (p0) {
                            Utils.fieldFocusChange(
                                context,
                                addDogVM.dateFocusNode.value,
                                addDogVM.weightFocusNode.value);
                          },
                          suffixIcon: GestureDetector(
                            onTap: () {
                              addDogVM.selectDate(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: SvgPicture.asset(AssetImages.dateIcon),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(AppStrings.weight,
                              style: Styles.expertSignupPaget1())),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextfield(
                        hintText: AppStrings.typeWeight,
                        obscureText: false,
                        controller: addDogVM.weightController.value,
                        focusNode: addDogVM.weightFocusNode.value,
                        onFieldSubmitted: (p0) {
                          Utils.fieldFocusChange(
                              context,
                              addDogVM.weightFocusNode.value,
                              addDogVM.microchipNumberFocusNode.value);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(AppStrings.microChipNum,
                            style: Styles.expertSignupPaget1()),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextfield(
                        hintText: AppStrings.typeChipNumber,
                        obscureText: false,
                        controller: addDogVM.microchipNumberController.value,
                        focusNode: addDogVM.microchipNumberFocusNode.value,
                        onFieldSubmitted: (p0) {},
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(AppStrings.breed,
                              style: Styles.expertSignupPaget1())),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 56,
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        decoration: ShapeDecoration(
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0x3F737373)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x0F000000),
                              blurRadius: 6,
                              offset: Offset(-2, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteName.selectBreedPage);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Text(
                                  breedsVM.breed.value == ''
                                      ? AppStrings.selectBreed
                                      : breedsVM.breed.value,
                                  style: Styles.expertSignupPaget2(),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child:
                                    SvgPicture.asset(AssetImages.nextBlackIcon),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(AppStrings.gender,
                              style: Styles.expertSignupPaget1())),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => SelectTextfield(
                          val: addDogVM.gender.value,
                          hintText: AppStrings.typeGender,
                          items: [
                            DropdownMenuItem(
                                value: 'Male',
                                onTap: () {
                                  addDogVM.gender.value = "Male";
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(AppStrings.male),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(AssetImages.male),
                                    )
                                  ],
                                )),
                            DropdownMenuItem(
                                value: 'Female',
                                onTap: () {
                                  addDogVM.gender.value = "Female";
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(AppStrings.female),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          SvgPicture.asset(AssetImages.female),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(AppStrings.neutered,
                            style: Styles.expertSignupPaget1()),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => SelectTextfield(
                          val: addDogVM.neutered.value,
                          hintText: AppStrings.neuteredHint,
                          items: [
                            DropdownMenuItem(
                                onTap: () {
                                  addDogVM.neutered.value = 'Yes';
                                },
                                value: 'Yes',
                                child: const Text(AppStrings.yes)),
                            DropdownMenuItem(
                                onTap: () {
                                  addDogVM.neutered.value = 'No';
                                },
                                value: 'No',
                                child: const Text(AppStrings.no)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(AppStrings.color,
                            style: Styles.expertSignupPaget1()),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => Container(
                          height: 56,
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          decoration: ShapeDecoration(
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 0.50, color: Color(0x3F737373)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x0F000000),
                                blurRadius: 6,
                                offset: Offset(-2, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: addDogVM.selectedColors.isEmpty
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.typeColor,
                                      style: Styles.expertSignupPaget2(),
                                    ),
                                    GestureDetector(
                                      onTap: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                AppStrings.pickColor),
                                            content: SingleChildScrollView(
                                              child: ColorPicker(
                                                pickerColor: AppColors.white,
                                                onColorChanged: (Color color) {
                                                  // Store the selected color temporarily
                                                  selectedColor = color;
                                                },
                                                pickerAreaHeightPercent: 0.8,
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  if (selectedColor != null) {
                                                    // Add the selected color to your list
                                                    addDogVM.addColor(
                                                        selectedColor!);

                                                    // Reset the selectedColor variable for the next selection
                                                    selectedColor = null;
                                                  }
                                                  Get.back();
                                                },
                                                child:
                                                    const Text(AppStrings.ok),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: SvgPicture.asset(
                                            AssetImages.addIcon),
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            addDogVM.selectedColors.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0, vertical: 5),
                                            child: GestureDetector(
                                              onTap: () =>
                                                  addDogVM.removeColor(index),
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: ShapeDecoration(
                                                  color: addDogVM
                                                      .selectedColors[index],
                                                  shape: const OvalBorder(
                                                    side: BorderSide(
                                                      width: 0.50,
                                                      strokeAlign: BorderSide
                                                          .strokeAlignOutside,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                AppStrings.pickColor),
                                            content: SingleChildScrollView(
                                              child: ColorPicker(
                                                pickerColor: AppColors.white,
                                                onColorChanged: (Color color) {
                                                  // Store the selected color temporarily
                                                  selectedColor = color;
                                                },
                                                pickerAreaHeightPercent: 0.8,
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  if (selectedColor != null) {
                                                    // Add the selected color to your list
                                                    addDogVM.addColor(
                                                        selectedColor!);

                                                    // Reset the selectedColor variable for the next selection
                                                    selectedColor = null;
                                                  }
                                                  Get.back();
                                                },
                                                child:
                                                    const Text(AppStrings.ok),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: SvgPicture.asset(
                                            AssetImages.addIcon),
                                      ),
                                    )
                                  ],
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 60,
              ),
               Obx(
                () => PrimartyButton(
                  loading: addDogVM.loading.value,
                  icon: '',
                  title: AppStrings.createButton,
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: 10,
                  onTap: () async {
                    await addDogVM.createDog();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

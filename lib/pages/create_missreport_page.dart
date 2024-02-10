import 'dart:io';
import 'package:dogapp/components/alternating_btn.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/select_field.dart';
import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/miss_dog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/pic_container.dart';
import '../routes/route_names.dart';
import '../view_models/breeds.dart';

class CreateMissingReport extends StatelessWidget {
  const CreateMissingReport({super.key});

  @override
  Widget build(BuildContext context) {
    final missVM = Get.put(MissDogModel());
    final breeds = Get.put(Breeds());
    final formkey = GlobalKey<FormState>();
    Color? selectedColor;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.missingReport),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => missVM.imageFlag.value
                          ? const SizedBox()
                          : SvgPicture.asset(AssetImages.uploadDog),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          missVM.imageFlag.value
                              ? PicContainer(
                                  width: 86,
                                  height: 86,
                                  child: Image.file(
                                    File(missVM.image!.path),
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
                                        missVM.selectImage();
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
                      height: 40,
                    ),
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
                    Form(
                        key: formkey,
                        child: Column(
                          children: [
                            Obx(
                              () => CustomTextfield(
                                hintText: AppStrings.typeDogName,
                                obscureText: false,
                                isError: missVM.nameError.value,
                                controller: missVM.nameController.value,
                                focusNode: missVM.nameFocusNode.value,
                                onFieldSubmitted: (p0) {
                                  Utils.fieldFocusChange(
                                      context,
                                      missVM.nameFocusNode.value,
                                      missVM.ageFocusNode.value);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(AppStrings.age,
                                    style: Styles.expertSignupPaget1())),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextfield(
                              hintText: '1 to 3 years',
                              obscureText: false,
                              controller: missVM.ageController.value,
                              focusNode: missVM.ageFocusNode.value,
                              onFieldSubmitted: (p0) {
                                Utils.fieldFocusChange(
                                    context,
                                    missVM.ageFocusNode.value,
                                    missVM.weightFocusNode.value);
                              },
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
                                val: missVM.gender.value,
                                hintText: AppStrings.typeGender,
                                items: [
                                  DropdownMenuItem(
                                      value: 'Male',
                                      onTap: () {
                                        missVM.gender.value = "Male";
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
                                            child: SvgPicture.asset(
                                                AssetImages.male),
                                          )
                                        ],
                                      )),
                                  DropdownMenuItem(
                                      value: 'Female',
                                      onTap: () {
                                        missVM.gender.value = "Female";
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
                                            child: SvgPicture.asset(
                                                AssetImages.female),
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
                                child: Text(AppStrings.weight,
                                    style: Styles.expertSignupPaget1())),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextfield(
                              hintText: AppStrings.typeWeight,
                              obscureText: false,
                              controller: missVM.weightController.value,
                              focusNode: missVM.weightFocusNode.value,
                              onFieldSubmitted: (p0) {
                                Utils.fieldFocusChange(
                                    context,
                                    missVM.weightFocusNode.value,
                                    missVM.microchipNumberFocusNode.value);
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
                              controller:
                                  missVM.microchipNumberController.value,
                              focusNode: missVM.microchipNumberFocusNode.value,
                              onFieldSubmitted: (p0) {
                                Utils.fieldFocusChange(
                                    context,
                                    missVM.microchipNumberFocusNode.value,
                                    missVM.dateFocusNode.value);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(AppStrings.lostDate,
                                    style: Styles.expertSignupPaget1())),
                            const SizedBox(
                              height: 8,
                            ),
                            Obx(
                              () => CustomTextfield(
                                hintText: AppStrings.dateFormat,
                                obscureText: false,
                                isError: missVM.dateError.value,
                                keyboardType: TextInputType.none,
                                controller: missVM.dateController.value,
                                focusNode: missVM.dateFocusNode.value,
                                onFieldSubmitted: (p0) {},
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    missVM.selectDate(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child:
                                        SvgPicture.asset(AssetImages.dateIcon),
                                  ),
                                ),
                              ),
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
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteName.selectBreedPage,
                                      arguments: false);
                                },
                                child: Container(
                                  height: 56,
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  decoration: missVM.breedError.value
                                      ? BoxDecoration(
                                          color: AppColors.white,
                                          border: Border.all(
                                              width: 2, color: AppColors.red),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8)),
                                        )
                                      : ShapeDecoration(
                                          color: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                width: 0.50,
                                                color: Color(0x3F737373)),
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Text(
                                          breeds.breed.value == ''
                                              ? AppStrings.selectBreed
                                              : breeds.breed.value,
                                          style: Styles.expertSignupPaget2(),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: SvgPicture.asset(
                                            AssetImages.nextBlackIcon),
                                      ),
                                    ],
                                  ),
                                ),
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
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                decoration: missVM.colorError.value
                                    ? BoxDecoration(
                                        color: AppColors.white,
                                        border: Border.all(
                                            width: 2, color: AppColors.red),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                      )
                                    : ShapeDecoration(
                                        color: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 0.50,
                                              color: Color(0x3F737373)),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                child: missVM.selectedColors.isEmpty
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
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ColorPicker(
                                                      pickerColor:
                                                          AppColors.white,
                                                      onColorChanged:
                                                          (Color color) {
                                                        // Store the selected color temporarily
                                                        selectedColor = color;
                                                      },
                                                      pickerAreaHeightPercent:
                                                          0.8,
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        if (selectedColor !=
                                                            null) {
                                                          // Add the selected color to your list
                                                          missVM.addColor(
                                                              selectedColor!);

                                                          // Reset the selectedColor variable for the next selection
                                                          selectedColor = null;
                                                        }
                                                        Get.back();
                                                      },
                                                      child: const Text(
                                                          AppStrings.ok),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
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
                                                  missVM.selectedColors.length,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 5.0,
                                                      vertical: 5),
                                                  child: GestureDetector(
                                                    onTap: () => missVM
                                                        .removeColor(index),
                                                    child: Container(
                                                      width: 40,
                                                      height: 40,
                                                      decoration:
                                                          ShapeDecoration(
                                                        color: missVM
                                                                .selectedColors[
                                                            index],
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
                                                  content:
                                                      SingleChildScrollView(
                                                    child: ColorPicker(
                                                      pickerColor:
                                                          AppColors.white,
                                                      onColorChanged:
                                                          (Color color) {
                                                        // Store the selected color temporarily
                                                        selectedColor = color;
                                                      },
                                                      pickerAreaHeightPercent:
                                                          0.8,
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        if (selectedColor !=
                                                            null) {
                                                          // Add the selected color to your list
                                                          missVM.addColor(
                                                              selectedColor!);

                                                          // Reset the selectedColor variable for the next selection
                                                          selectedColor = null;
                                                        }
                                                        Get.back();
                                                      },
                                                      child: const Text(
                                                          AppStrings.ok),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(6.0),
                                              child: SvgPicture.asset(
                                                  AssetImages.addIcon),
                                            ),
                                          )
                                        ],
                                      ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppStrings.yourName,
                                style: Styles.expertSignupPaget1(),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Obx(
                              () => CustomTextfield(
                                hintText: AppStrings.typeYourname,
                                obscureText: false,
                                isError: missVM.yourNameError.value,
                                controller: missVM.yourNameController.value,
                                focusNode: missVM.yourNameFocusNode.value,
                                onFieldSubmitted: (p0) {
                                  Utils.fieldFocusChange(
                                      context,
                                      missVM.yourNameFocusNode.value,
                                      missVM.addressFocusNode.value);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(AppStrings.yourAddress,
                                    style: Styles.expertSignupPaget1())),
                            const SizedBox(
                              height: 8,
                            ),
                            Obx(
                              () => CustomTextfield(
                                hintText: AppStrings.typeAddress,
                                obscureText: false,
                                isError: missVM.addressError.value,
                                controller: missVM.addressController.value,
                                focusNode: missVM.addressFocusNode.value,
                                onFieldSubmitted: (p0) {
                                  Utils.fieldFocusChange(
                                      context,
                                      missVM.addressFocusNode.value,
                                      missVM.phoneNumFocusNode.value);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(AppStrings.yourNumber,
                                    style: Styles.expertSignupPaget1())),
                            const SizedBox(
                              height: 8,
                            ),
                            Obx(
                              () => CustomTextfield(
                                hintText: AppStrings.typeNumber,
                                obscureText: false,
                                isError: missVM.numberError.value,
                                controller: missVM.phoneNumController.value,
                                focusNode: missVM.phoneNumFocusNode.value,
                                onFieldSubmitted: (p0) {
                                  Utils.fieldFocusChange(
                                      context,
                                      missVM.phoneNumFocusNode.value,
                                      missVM.notesFocusNode.value);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(AppStrings.notes,
                                    style: Styles.expertSignupPaget1())),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextfield(
                              hintText: AppStrings.typeNotes,
                              obscureText: false,
                              controller: missVM.notesController.value,
                              focusNode: missVM.notesFocusNode.value,
                              onFieldSubmitted: (p0) {},
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(AppStrings.multiplePhotos,
                        style: Styles.expertSignupPaget1()),
                    const SizedBox(
                      height: 15,
                    ),
                    AlternatingButton(
                        title: AppStrings.photo,
                        outlined: false,
                        width: 140,
                        height: 54,
                        icon: AssetImages.galleryIcon,
                        onPress: () async {
                          await missVM.pickMultipleImages();
                        },
                        style: Styles.white16(),
                        withIcon: true),
                    const SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Obx(
                              () => Checkbox(
                                value: missVM.checkbox.value,
                                onChanged: (value) {
                                  missVM.checkbox.value = value!;
                                },
                                side: const BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFF018383),
                                ),
                                activeColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      width: 1,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      color: Color(0xFF018383),
                                    ),
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            AppStrings.sendNotiAll,
                            style: Styles.expertSignupPaget1(),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => PrimartyButton(
                        icon: '',
                        title: AppStrings.share,
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: 10,
                        loading: missVM.loading.value,
                        onTap: () async {
                          missVM.breed.value = breeds.breed.value;
                          await missVM.createDog();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

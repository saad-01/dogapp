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
import 'package:dogapp/view_models/found_dog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/pic_container.dart';

class CreateFoundReport extends StatelessWidget {
  const CreateFoundReport({super.key});

  @override
  Widget build(BuildContext context) {
    final foundVM = Get.put(FoundDogModel());
    final formkey = GlobalKey<FormState>();
    Color? selectedColor;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.foundOne),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => foundVM.imageFlag.value
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
                          foundVM.imageFlag.value
                              ? PicContainer(
                                  width: 86,
                                  height: 86,
                                  child: Image.file(
                                    File(foundVM.image!.path),
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
                                        foundVM.selectImage();
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
                    Form(
                        key: formkey,
                        child: Column(
                          children: [
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
                            CustomTextfield(
                              hintText: AppStrings.typeYourname,
                              obscureText: false,
                              controller: foundVM.yourNameController.value,
                              focusNode: foundVM.yourNameFocusNode.value,
                              onFieldSubmitted: (p0) {
                                Utils.fieldFocusChange(
                                    context,
                                    foundVM.yourNameFocusNode.value,
                                    foundVM.addressFocusNode.value);
                              },
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
                            CustomTextfield(
                              hintText: AppStrings.typeAddress,
                              obscureText: false,
                              controller: foundVM.addressController.value,
                              focusNode: foundVM.addressFocusNode.value,
                              onFieldSubmitted: (p0) {
                                Utils.fieldFocusChange(
                                    context,
                                    foundVM.addressFocusNode.value,
                                    foundVM.phoneNumFocusNode.value);
                              },
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
                            CustomTextfield(
                              hintText: AppStrings.typeNumber,
                              obscureText: false,
                              controller: foundVM.phoneNumController.value,
                              focusNode: foundVM.phoneNumFocusNode.value,
                              onFieldSubmitted: (p0) {
                                Utils.fieldFocusChange(
                                    context,
                                    foundVM.phoneNumFocusNode.value,
                                    foundVM.notesFocusNode.value);
                              },
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
                              controller: foundVM.notesController.value,
                              focusNode: foundVM.notesFocusNode.value,
                              onFieldSubmitted: (p0) {
                                Utils.fieldFocusChange(
                                    context,
                                    foundVM.notesFocusNode.value,
                                    foundVM.microchipNumberFocusNode.value);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Dog's ${AppStrings.microChipNum}",
                                  style: Styles.expertSignupPaget1()),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextfield(
                              hintText: AppStrings.typeChipNumber,
                              obscureText: false,
                              controller:
                                  foundVM.microchipNumberController.value,
                              focusNode: foundVM.microchipNumberFocusNode.value,
                              onFieldSubmitted: (p0) {
                                Utils.fieldFocusChange(
                                    context,
                                    foundVM.microchipNumberFocusNode.value,
                                    foundVM.dateFocusNode.value);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(AppStrings.foundDate,
                                    style: Styles.expertSignupPaget1())),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextfield(
                              hintText: AppStrings.dateFormat,
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              controller: foundVM.dateController.value,
                              focusNode: foundVM.dateFocusNode.value,
                              onFieldSubmitted: (p0) {},
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  foundVM.selectDate(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: SvgPicture.asset(AssetImages.dateIcon),
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Dog's ${AppStrings.gender}",
                            style: Styles.expertSignupPaget1())),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => SelectTextfield(
                        val: foundVM.gender.value,
                        hintText: AppStrings.typeGender,
                        items: [
                          DropdownMenuItem(
                              value: 'Male',
                              onTap: () {
                                foundVM.gender.value = "Male";
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
                                foundVM.gender.value = "Female";
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
                                    child: SvgPicture.asset(AssetImages.female),
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
                      child: Text("Dog's ${AppStrings.color}",
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
                        child: foundVM.selectedColors.isEmpty
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
                                          title:
                                              const Text(AppStrings.pickColor),
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
                                                  foundVM
                                                      .addColor(selectedColor!);

                                                  // Reset the selectedColor variable for the next selection
                                                  selectedColor = null;
                                                }
                                                Get.back();
                                              },
                                              child: const Text(AppStrings.ok),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child:
                                          SvgPicture.asset(AssetImages.addIcon),
                                    ),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: foundVM.selectedColors.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 5),
                                          child: GestureDetector(
                                            onTap: () =>
                                                foundVM.removeColor(index),
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: ShapeDecoration(
                                                color: foundVM
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
                                          title:
                                              const Text(AppStrings.pickColor),
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
                                                  foundVM
                                                      .addColor(selectedColor!);

                                                  // Reset the selectedColor variable for the next selection
                                                  selectedColor = null;
                                                }
                                                Get.back();
                                              },
                                              child: const Text(AppStrings.ok),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child:
                                          SvgPicture.asset(AssetImages.addIcon),
                                    ),
                                  )
                                ],
                              ),
                      ),
                    ),
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
                        style: Styles.white16(),
                        onPress: () async {
                          await foundVM.pickMultipleImages();
                        },
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
                                value: foundVM.checkbox.value,
                                onChanged: (value) {
                                  foundVM.checkbox.value = value!;
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
                        loading: foundVM.loading.value,
                        onTap: () async {
                          await foundVM.createDog();
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

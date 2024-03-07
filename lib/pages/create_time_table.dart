import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/textfield.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../view_models/timetable_model.dart';

class CreateTimeTable extends StatefulWidget {
  const CreateTimeTable({super.key});

  @override
  State<CreateTimeTable> createState() => _CreateTimeTableState();
}

class _CreateTimeTableState extends State<CreateTimeTable> {

  RxBool showMorning = false.obs;
  RxBool showEvening = false.obs;
  RxBool showMidday = false.obs;
  final vm = Get.put(TimeTableModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.timeTable),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        if (showMorning.value) {
                          showMorning.value = false;
                        } else {
                          showMorning.value = true;
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 20),
                        decoration: ShapeDecoration(
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.50,
                              color: AppColors.black
                                  .withOpacity(0.11999999731779099),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x1E000000),
                              blurRadius: 8,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      AppStrings.morning,
                                      style: Styles.appBarH1(),
                                    )
                                  ],
                                ),
                                GestureDetector(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: showMorning.value
                                        ? SvgPicture.asset(AssetImages.blackUp)
                                        : SvgPicture.asset(
                                            AssetImages.dropDown),
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: showMorning.value,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppStrings.foodName,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextfield(
                                    hintText: AppStrings.typeFood,
                                    obscureText: false,
                                    controller: vm.foodNameController.value,
                                    focusNode: vm.foodNameFocusNode.value,
                                    isError: vm.nameError.value,
                                    onFieldSubmitted: (p0) {
                                      Utils.fieldFocusChange(
                                          context,
                                          vm.foodNameFocusNode.value,
                                          vm.quantityFocusNode.value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppStrings.quantity,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextfield(
                                    hintText: '00 gram',
                                    obscureText: false,
                                    controller: vm.quantityController.value,
                                    focusNode: vm.quantityFocusNode.value,
                                    isError: vm.quantityError.value,
                                    onFieldSubmitted: (p0) {
                                      Utils.fieldFocusChange(
                                          context,
                                          vm.quantityFocusNode.value,
                                          vm.caloriesFocusNode.value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppStrings.calories,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextfield(
                                    hintText: '00 kcal',
                                    obscureText: false,
                                    controller: vm.caloriesController.value,
                                    focusNode: vm.caloriesFocusNode.value,
                                    isError: vm.caloriesError.value,
                                    onFieldSubmitted: (p0) {
                                      Utils.fieldFocusChange(
                                          context,
                                          vm.caloriesFocusNode.value,
                                          vm.timeFocusNode.value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppStrings.timeHeading,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextfield(
                                    hintText: AppStrings.time,
                                    obscureText: false,
                                    controller: vm.timeController.value,
                                    focusNode: vm.timeFocusNode.value,
                                    isError: vm.timeError.value,
                                    onFieldSubmitted: (p0) {},
                                    suffixIcon: GestureDetector(
                              onTap: () async {
                                await vm.selectTime(
                                    context, vm.timeController.value);
                               vm.checkMorningTimePeriod();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child:
                                    SvgPicture.asset(AssetImages.outlineWatch),
                              ),
                            ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        if (showMidday.value) {
                          showMidday.value = false;
                        } else {
                          showMidday.value = true;
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 20),
                        decoration: ShapeDecoration(
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.50,
                              color: AppColors.black
                                  .withOpacity(0.11999999731779099),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x1E000000),
                              blurRadius: 8,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      AppStrings.midday,
                                      style: Styles.appBarH1(),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: showMidday.value
                                      ? SvgPicture.asset(AssetImages.blackUp)
                                      : SvgPicture.asset(AssetImages.dropDown),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: showMidday.value,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppStrings.foodName,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextfield(
                                    hintText: AppStrings.typeFood,
                                    obscureText: false,
                                    controller: vm.foodNameController2.value,
                                    focusNode: vm.foodNameFocusNode2.value,
                                    isError: vm.nameError2.value,
                                    onFieldSubmitted: (p0) {
                                      Utils.fieldFocusChange(
                                          context,
                                          vm.foodNameFocusNode2.value,
                                          vm.quantityFocusNode2.value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppStrings.quantity,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextfield(
                                    hintText: '00 gram',
                                    obscureText: false,
                                    controller: vm.quantityController2.value,
                                    focusNode: vm.quantityFocusNode2.value,
                                    isError: vm.quantityError2.value,
                                    onFieldSubmitted: (p0) {
                                      Utils.fieldFocusChange(
                                          context,
                                          vm.quantityFocusNode2.value,
                                          vm.caloriesFocusNode2.value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppStrings.calories,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextfield(
                                    hintText: '00 kcal',
                                    obscureText: false,
                                    controller: vm.caloriesController2.value,
                                    focusNode: vm.caloriesFocusNode2.value,
                                    isError: vm.caloriesError2.value,
                                    onFieldSubmitted: (p0) {
                                      Utils.fieldFocusChange(
                                          context,
                                          vm.caloriesFocusNode2.value,
                                          vm.timeFocusNode2.value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppStrings.timeHeading,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextfield(
                                    hintText: AppStrings.time,
                                    obscureText: false,
                                    controller: vm.timeController2.value,
                                    focusNode: vm.timeFocusNode2.value,
                                    isError: vm.timeError2.value,
                                    onFieldSubmitted: (p0) {},
                                    suffixIcon: GestureDetector(
                              onTap: () async {
                                await vm.selectTime(
                                    context, vm.timeController2.value);
                                vm.checkMidTimePeriod();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child:
                                    SvgPicture.asset(AssetImages.outlineWatch),
                              ),
                            ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () {
                        if (showEvening.value) {
                          showEvening.value = false;
                        } else {
                          showEvening.value = true;
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 20),
                        decoration: ShapeDecoration(
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.50,
                              color: AppColors.black
                                  .withOpacity(0.11999999731779099),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x1E000000),
                              blurRadius: 8,
                              offset: Offset(0, 0),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      AppStrings.evening,
                                      style: Styles.appBarH1(),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: showEvening.value
                                      ? SvgPicture.asset(AssetImages.blackUp)
                                      : SvgPicture.asset(AssetImages.dropDown),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: showEvening.value,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppStrings.foodName,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextfield(
                                    hintText: AppStrings.typeFood,
                                    obscureText: false,
                                    controller: vm.foodNameController3.value,
                                    focusNode: vm.foodNameFocusNode3.value,
                                    isError: vm.nameError3.value,
                                    onFieldSubmitted: (p0) {
                                      Utils.fieldFocusChange(
                                          context,
                                          vm.foodNameFocusNode3.value,
                                          vm.quantityFocusNode3.value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppStrings.quantity,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextfield(
                                    hintText: '00 gram',
                                    obscureText: false,
                                    controller: vm.quantityController3.value,
                                    focusNode: vm.quantityFocusNode3.value,
                                    isError: vm.quantityError3.value,
                                    onFieldSubmitted: (p0) {
                                      Utils.fieldFocusChange(
                                          context,
                                          vm.quantityFocusNode3.value,
                                          vm.caloriesFocusNode3.value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppStrings.calories,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextfield(
                                    hintText: '00 kcal',
                                    obscureText: false,
                                    controller: vm.caloriesController3.value,
                                    focusNode: vm.caloriesFocusNode3.value,
                                    isError: vm.caloriesError3.value,
                                    onFieldSubmitted: (p0) {
                                      Utils.fieldFocusChange(
                                          context,
                                          vm.caloriesFocusNode3.value,
                                          vm.timeFocusNode3.value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppStrings.timeHeading,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextfield(
                                    hintText: AppStrings.time,
                                    obscureText: false,
                                    controller: vm.timeController3.value,
                                    focusNode: vm.timeFocusNode3.value,
                                    isError: vm.timeError3.value,
                                    onFieldSubmitted: (p0) {},
                                    suffixIcon: GestureDetector(
                              onTap: () async {
                                await vm.selectTime(
                                    context, vm.timeController3.value);
                                vm.checkEveningTimePeriod();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child:
                                    SvgPicture.asset(AssetImages.outlineWatch),
                              ),
                            ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimartyButton(
                      title: AppStrings.save,
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      height: 10,
                      onTap: () async {
                        await vm.timeTable();
                      },
                      icon: '')
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}

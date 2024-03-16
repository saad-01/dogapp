import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/view_models/add_food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/select_field.dart';
import '../components/textfield.dart';
import '../utils/styles.dart';

class AddFoodPage extends StatefulWidget {
  const AddFoodPage({super.key});

  @override
  State<AddFoodPage> createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  final foodVM = Get.put(FoodModel());
  final formkey = GlobalKey<FormState>();
  final doc = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.addFood.tr),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(AssetImages.dogFood),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    width: 60,
                    child: Divider(
                      color: Color(0xFFA8A8A8),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.foodName.tr,
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
                            hintText: AppStrings.typeFood.tr,
                            obscureText: false,
                            isError: foodVM.nameError.value,
                            controller: foodVM.foodNameController.value,
                            focusNode: foodVM.foodNameFocusNode.value,
                            onFieldSubmitted: (p0) {
                              // Utils.fieldFocusChange(
                              //     context,
                              //     foodVM.foodNameFocusNode.value,
                              //     foodVM.timeFocusNode.value);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppStrings.timeHeading.tr,
                            style: Styles.expertSignupPaget1(),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Obx(
                          () => CustomTextfield(
                            hintText: foodVM.timeController.value.text == ''
                                ? AppStrings.time.tr
                                : foodVM.timeController.value.text,
                            obscureText: false,
                            isError: foodVM.timeError.value,
                            // keyboardType: TextInputType.none,
                            controller: foodVM.timeController.value,
                            focusNode: foodVM.timeFocusNode.value,
                            onFieldSubmitted: (p0) {
                              // Utils.fieldFocusChange(
                              //     context,
                              //     foodVM.timeFocusNode.value,
                              //     foodVM.notesFocusNode.value);
                            },
                            suffixIcon: GestureDetector(
                              onTap: () async {
                                await foodVM.selectTime(
                                    context, foodVM.timeController.value);
                                foodVM.checkTimePeriod();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child:
                                    SvgPicture.asset(AssetImages.outlineWatch),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppStrings.notes.tr,
                            style: Styles.expertSignupPaget1(),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextfield(
                          hintText: AppStrings.typeNotes.tr,
                          obscureText: false,
                          controller: foodVM.notesController.value,
                          focusNode: foodVM.notesFocusNode.value,
                          onFieldSubmitted: (p0) {
                            // Utils.fieldFocusChange(
                            //     context,
                            //     foodVM.notesFocusNode.value,
                            //     foodVM.reminderTimeFocusNode.value);
                          },
                        ),

                        // const SizedBox(
                        //   height: 18,
                        // ),
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Text(
                        //     AppStrings.foodOutside.tr,
                        //     style: Styles.expertSignupPaget1(),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 8,
                        // ),
                        // CustomTextfield(
                        //   hintText: 'Mon',
                        //   obscureText: false,
                        //   suffixIcon: Padding(
                        //     padding: const EdgeInsets.all(18.0),
                        //     child: SvgPicture.asset(AssetImages.selectFieldIcon),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 18,
                        // ),
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Text(
                        //     AppStrings.weight.tr,
                        //     style: Styles.expertSignupPaget1(),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 8,
                        // ),
                        // const CustomTextfield(
                        //   hintText: '00:00 KG',
                        //   obscureText: false,
                        // ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          AppStrings.reminderNoti.tr,
                          style: Styles.expertSignupPaget1(),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppStrings.timeHeading.tr,
                            style: Styles.expertSignupPaget1(),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Obx(
                          () => CustomTextfield(
                            hintText:
                                foodVM.reminderTimeController.value.text == ''
                                    ? AppStrings.time.tr
                                    : foodVM.reminderTimeController.value.text,
                            // keyboardType: TextInputType.none,
                            controller: foodVM.reminderTimeController.value,
                            focusNode: foodVM.reminderTimeFocusNode.value,
                            onFieldSubmitted: (p0) {},
                            obscureText: false,
                            suffixIcon: GestureDetector(
                              onTap: () async {
                                await foodVM.selectTime(context,
                                    foodVM.reminderTimeController.value);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child:
                                    SvgPicture.asset(AssetImages.outlineWatch),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.day.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => SelectTextfield(
                      val: foodVM.day.value,
                      hintText: AppStrings.typeGender.tr,
                      items: [
                        DropdownMenuItem(
                            value: 'Never',
                            onTap: () {
                              foodVM.day.value = "Never";
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.never.tr),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Monday',
                            onTap: () {
                              foodVM.day.value = "Monday";
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.monday.tr),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Tuesday',
                            onTap: () {
                              foodVM.day.value = "Tuesday";
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.tuesday.tr),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Wednesday',
                            onTap: () {
                              foodVM.day.value = "Wednesday";
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.wednesday.tr),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Thursday',
                            onTap: () {
                              foodVM.day.value = "Thursday";
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.thursday.tr),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Friday',
                            onTap: () {
                              foodVM.day.value = "Friday";
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.friday.tr),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Saturday',
                            onTap: () {
                              foodVM.day.value = "Saturday";
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.saturday.tr),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Sunday',
                            onTap: () {
                              foodVM.day.value = "Sunday";
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.sunday.tr),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Everyday',
                            onTap: () {
                              foodVM.day.value = "Everyday";
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.everyday.tr),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Weekdays',
                            onTap: () {
                              foodVM.day.value = "Weekdays";
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.weekdays.tr),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Weekend',
                            onTap: () {
                              foodVM.day.value = "Weekend";
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.weekend.tr),
                              ],
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Obx(
                    () => PrimartyButton(
                        loading: foodVM.loading.value,
                        title: AppStrings.save.tr,
                        width: MediaQuery.sizeOf(context).width * 0.75,
                        height: 10,
                        onTap: () async {
                          await foodVM.addFood(doc['dogId']);
                        },
                        icon: ''),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}

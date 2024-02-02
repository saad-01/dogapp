import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/add_food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/select_field.dart';
import '../components/textfield.dart';
import '../utils/styles.dart';

class AddFoodPage extends StatelessWidget {
  const AddFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final foodVM = Get.put(FoodModel());
    final QueryDocumentSnapshot<Object> arguments = Get.arguments;
    final doc = arguments;
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.addFood),
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
                      AppStrings.foodName,
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
                        CustomTextfield(
                          hintText: AppStrings.typeFood,
                          obscureText: false,
                          controller: foodVM.foodNameController.value,
                          focusNode: foodVM.foodNameFocusNode.value,
                          onFieldSubmitted: (p0) {
                            // Utils.fieldFocusChange(
                            //     context,
                            //     foodVM.foodNameFocusNode.value,
                            //     foodVM.timeFocusNode.value);
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
                        Obx(
                          () => CustomTextfield(
                            hintText: foodVM.timeController.value.text == ''
                                ? AppStrings.time
                                : foodVM.timeController.value.text,
                            obscureText: false,
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
                            AppStrings.notes,
                            style: Styles.expertSignupPaget1(),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextfield(
                          hintText: AppStrings.typeNotes,
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
                        //     AppStrings.foodOutside,
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
                        //     AppStrings.weight,
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
                          AppStrings.reminderNoti,
                          style: Styles.expertSignupPaget1(),
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
                        Obx(
                          () => CustomTextfield(
                            hintText:
                                foodVM.reminderTimeController.value.text == ''
                                    ? AppStrings.time
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
                      AppStrings.day,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => SelectTextfield(
                      val: foodVM.day.value,
                      hintText: AppStrings.typeGender,
                      items: [
                        DropdownMenuItem(
                            value: 'Never',
                            onTap: () {
                              foodVM.day.value = "Never";
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.never),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Monday',
                            onTap: () {
                              foodVM.day.value = "Monday";
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.monday),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Tuesday',
                            onTap: () {
                              foodVM.day.value = "Tuesday";
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.tuesday),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Wednesday',
                            onTap: () {
                              foodVM.day.value = "Wednesday";
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.wednesday),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Thursday',
                            onTap: () {
                              foodVM.day.value = "Thursday";
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.thursday),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Friday',
                            onTap: () {
                              foodVM.day.value = "Friday";
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.friday),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Saturday',
                            onTap: () {
                              foodVM.day.value = "Saturday";
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.saturday),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Sunday',
                            onTap: () {
                              foodVM.day.value = "Sunday";
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.sunday),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Everyday',
                            onTap: () {
                              foodVM.day.value = "Everyday";
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.everyday),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Weekdays',
                            onTap: () {
                              foodVM.day.value = "Weekdays";
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.weekdays),
                              ],
                            )),
                        DropdownMenuItem(
                            value: 'Weekend',
                            onTap: () {
                              foodVM.day.value = "Weekend";
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppStrings.weekend),
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
                        title: AppStrings.save,
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

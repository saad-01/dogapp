import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/textfield.dart';
import '../routes/route_names.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../view_models/timetable_model.dart';

class CreateDietPlan extends StatefulWidget {
  const CreateDietPlan({super.key});

  @override
  State<CreateDietPlan> createState() => _CreateDietPlanState();
}

class _CreateDietPlanState extends State<CreateDietPlan> {
  final timeVM = Get.put(TimeTableModel());
  final vm = Get.put(DietModel());
  final DocumentSnapshot<Object> doc = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.createPlan.tr),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.description.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextfield(
                    hintText: AppStrings.typeNotes.tr,
                    obscureText: false,
                    controller: vm.descripController.value,
                    focusNode: vm.descripFocusNode.value,
                    isError: vm.descripError.value,
                    onFieldSubmitted: (p0) {
                      Utils.fieldFocusChange(context, vm.descripFocusNode.value,
                          vm.startFocusNode.value);
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.startDate.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextfield(
                    hintText: vm.startController.value.text == ''
                        ? AppStrings.dateFormat.tr
                        : vm.startController.value.text,
                    obscureText: false,
                    controller: vm.startController.value,
                    focusNode: vm.startFocusNode.value,
                    isError: vm.startError.value,
                    onFieldSubmitted: (p0) {
                      Utils.fieldFocusChange(context, vm.startFocusNode.value,
                          vm.endFocusNode.value);
                    },
                    suffixIcon: GestureDetector(
                      onTap: () {
                        vm.selectDate(context, vm.startController.value);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(AssetImages.dateIcon),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.endDate.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextfield(
                    hintText: vm.endController.value.text == ''
                        ? AppStrings.dateFormat.tr
                        : vm.endController.value.text,
                    obscureText: false,
                    controller: vm.endController.value,
                    focusNode: vm.endFocusNode.value,
                    isError: vm.endError.value,
                    onFieldSubmitted: (p0) {},
                    suffixIcon: GestureDetector(
                      onTap: () {
                        vm.selectDate(context, vm.endController.value);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(AssetImages.dateIcon),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.createTimeTable.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.createDetailedTb.tr,
                      style: Styles.lightGrey12(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(
                    () => timeVM.timeSet.value
                        ? Container(
                            padding: const EdgeInsets.all(16),
                            decoration: ShapeDecoration(
                              color: AppColors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.50,
                                  color: Colors.black
                                      .withOpacity(0.11999999731779099),
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              shadows: const [
                                BoxShadow(
                                  color: Color(0x0F000000),
                                  blurRadius: 8,
                                  offset: Offset(0, 2),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.morning.tr,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                    Text(
                                      timeVM.timeController.value.text,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.midday.tr,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                    Text(
                                      timeVM.timeController2.value.text,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.evening.tr,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                    Text(
                                      timeVM.timeController3.value.text,
                                      style: Styles.expertSignupPaget1(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteName.createTimeTable);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 18),
                              height: 101,
                              decoration: ShapeDecoration(
                                color: const Color(0xFFFFF9F2),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.50,
                                    color: Colors.black
                                        .withOpacity(0.11999999731779099),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x0F000000),
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(AssetImages.timeTable),
                                  Text(
                                    AppStrings.createTimeTable.tr,
                                    style: Styles.expertSignupPaget1(),
                                  ),
                                  SvgPicture.asset(AssetImages.nextBlackIcon),
                                ],
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  // Row(
                  //   children: [
                  //     Container(
                  //       width: 24,
                  //       height: 24,
                  //       decoration: ShapeDecoration(
                  //         shape: RoundedRectangleBorder(
                  //             side: const BorderSide(
                  //               width: 1,
                  //               strokeAlign: BorderSide.strokeAlignCenter,
                  //               color: Color(0xFF018383),
                  //             ),
                  //             borderRadius: BorderRadius.circular(6)),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 15,
                  //     ),
                  //     Text(
                  //       AppStrings.sendNoti.tr,
                  //       style: Styles.expertSignupPaget1(),
                  //     )
                  //   ],
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() => PrimartyButton(
                      title: AppStrings.share.tr,
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      height: 10,
                      loading: vm.loading.value,
                      onTap: () async {
                        await vm.addPlan(
                            doc['dogId'], jsonEncode(timeVM.categories));
                      },
                      icon: '')),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}

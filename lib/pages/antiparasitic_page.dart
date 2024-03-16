import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/expert_item.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/antiparasite_model.dart';
import 'package:dogapp/view_models/select_expert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/alternating_btn.dart';
import '../components/textfield.dart';
import '../routes/route_names.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';

class AntiParasiteReportPage extends StatefulWidget {
  const AntiParasiteReportPage({super.key});

  @override
  State<AntiParasiteReportPage> createState() => _AntiParasiteReportPageState();
}

class _AntiParasiteReportPageState extends State<AntiParasiteReportPage> {
  final QueryDocumentSnapshot<Object> arguments = Get.arguments;
  final antiVM = Get.put(AnitParasiteModel());
  final expertVM = Get.put(SelectExpertModel());
  @override
  Widget build(BuildContext context) {
    final doc = arguments;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.antiparasitic.tr),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(AssetImages.antiParasite),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    width: 70,
                    child: Divider(
                      color: Color(0xFFA8A8A8),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     AppStrings.dogName.tr,
                  //     style: Styles.expertSignupPaget1(),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // const CustomTextfield(
                  //   hintText: AppStrings.typeDogName.tr,
                  //   obscureText: false,
                  // ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.reasonAppointment.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => CustomTextfield(
                      hintText: AppStrings.typeNotes.tr,
                      obscureText: false,
                      isError: antiVM.reasonError.value,
                      onFieldSubmitted: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            antiVM.reasonFocusNode.value,
                            antiVM.dateFocusNode.value);
                      },
                      controller: antiVM.reasonController.value,
                      focusNode: antiVM.reasonFocusNode.value,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.date.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => CustomTextfield(
                      hintText: antiVM.dateController.value.text == ''
                          ? AppStrings.dateFormat.tr
                          : antiVM.dateController.value.text,
                      obscureText: false,
                      isError: antiVM.dateError.value,
                      keyboardType: TextInputType.none,
                      controller: antiVM.dateController.value,
                      focusNode: antiVM.dateFocusNode.value,
                      onFieldSubmitted: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            antiVM.dateFocusNode.value,
                            antiVM.timeFocusNode.value);
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          antiVM.selectDate(
                              context, antiVM.dateController.value);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(AssetImages.dateIcon),
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
                      AppStrings.timeHeading.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => CustomTextfield(
                      hintText: antiVM.reminderTimeController.value.text == ''
                          ? AppStrings.time.tr
                          : antiVM.timeController.value.text,
                      keyboardType: TextInputType.none,
                      isError: antiVM.timeError.value,
                      controller: antiVM.timeController.value,
                      focusNode: antiVM.timeFocusNode.value,
                      onFieldSubmitted: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            antiVM.timeFocusNode.value,
                            antiVM.notesFocusNode.value);
                      },
                      obscureText: false,
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          await antiVM.selectTime(
                              context, antiVM.timeController.value);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SvgPicture.asset(AssetImages.outlineWatch),
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
                    onFieldSubmitted: (p0) {
                      Utils.fieldFocusChange(
                          context,
                          antiVM.notesFocusNode.value,
                          antiVM.reminderDateFocusNode.value);
                    },
                    controller: antiVM.notesController.value,
                    focusNode: antiVM.notesFocusNode.value,
                  ),
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
                  // const SizedBox(
                  //   height: 18,
                  // ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     AppStrings.doze.tr,
                  //     style: Styles.expertSignupPaget1(),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // const CustomTextfield(
                  //   hintText: '00lb',
                  //   obscureText: false,
                  // ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.addFiles.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      AlternatingButton(
                        title: AppStrings.photo.tr,
                        outlined: false,
                        onPress: () async {
                          await antiVM.pickMultipleImages();
                        },
                        width: 139,
                        height: 54,
                        icon: AssetImages.galleryIcon,
                        withIcon: true,
                        style: Styles.white16(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AlternatingButton(
                        title: AppStrings.files.tr,
                        outlined: true,
                        onPress: () async {
                          await antiVM.pickMultipleFiles();
                        },
                        width: 139,
                        height: 54,
                        icon: AssetImages.fileIcon,
                        withIcon: true,
                        style: Styles.primaryText(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.yourDoc.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Obx(
                    () => expertVM.id.value == ''
                        ? Container(
                            width: MediaQuery.sizeOf(context).width * 0.84,
                            decoration: antiVM.expertError.value
                                ? BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(
                                        width: 2, color: AppColors.red),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(6)),
                                  )
                                : ShapeDecoration(
                                    color: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: Color(0x1E010101)),
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
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(AssetImages.otherExpert),
                              ),
                              trailing:
                                  SvgPicture.asset(AssetImages.nextPrimaryIcon),
                              title: Text(
                                AppStrings.selectDoc.tr,
                                style: Styles.choosePageText(),
                              ),
                              onTap: () {
                                Get.toNamed(RouteName.selectExpertPage);
                              },
                            ),
                          )
                        : ExpertItem(
                            expertis: AppStrings.trainExpert.tr,
                            filledBtnTitle: '',
                            name: expertVM.name.value,
                            url: expertVM.url.value,
                          ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Text(
                    AppStrings.reminderNoti.tr,
                    style: Styles.expertSignupPaget1(),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.date.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => CustomTextfield(
                      hintText: antiVM.reminderDateController.value.text == ''
                          ? AppStrings.dateFormat.tr
                          : antiVM.reminderDateController.value.text,
                      obscureText: false,
                      keyboardType: TextInputType.none,
                      controller: antiVM.reminderDateController.value,
                      focusNode: antiVM.reminderDateFocusNode.value,
                      onFieldSubmitted: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            antiVM.reminderDateFocusNode.value,
                            antiVM.reminderTimeFocusNode.value);
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          antiVM.selectDate(
                              context, antiVM.reminderDateController.value);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(AssetImages.dateIcon),
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
                      AppStrings.timeHeading.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => CustomTextfield(
                      hintText: antiVM.reminderTimeController.value.text == ''
                          ? AppStrings.time.tr
                          : antiVM.reminderTimeController.value.text,
                      // keyboardType: TextInputType.none,
                      controller: antiVM.reminderTimeController.value,
                      focusNode: antiVM.reminderTimeFocusNode.value,
                      onFieldSubmitted: (p0) {},
                      obscureText: false,
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          await antiVM.selectTime(
                              context, antiVM.reminderTimeController.value);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SvgPicture.asset(AssetImages.outlineWatch),
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
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Obx(() => PrimartyButton(
                      title: AppStrings.request.tr,
                      loading: antiVM.loading.value,
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      height: 10,
                      onTap: () async {
                        antiVM.dogId.value = doc['dogId'];
                        antiVM.expertId.value = expertVM.id.value;
                        await antiVM.addVaccination();
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

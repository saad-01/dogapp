import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/expert_item.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/select_field.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/select_expert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/alternating_btn.dart';
import '../components/textfield.dart';
import '../routes/route_names.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../view_models/vaccination_model.dart';

class VaccinationReportPage extends StatefulWidget {
  const VaccinationReportPage({super.key});

  @override
  State<VaccinationReportPage> createState() => _VaccinationReportPageState();
}

class _VaccinationReportPageState extends State<VaccinationReportPage> {
  final QueryDocumentSnapshot<Object> arguments = Get.arguments;
  final VaccinationModel vaccinationVM = Get.put(VaccinationModel());
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
            const CustomAppBar(title: AppStrings.vaccinationReport),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(AssetImages.injectionImage),
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
                  //     AppStrings.dogName,
                  //     style: Styles.expertSignupPaget1(),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // const CustomTextfield(
                  //   hintText: AppStrings.typeDogName,
                  //   obscureText: false,
                  // ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.typeVaccine,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => SelectTextfield(
                      hintText: AppStrings.selectVaccine,
                      val: vaccinationVM.type.value,
                      isError: vaccinationVM.typeError.value,
                      items: vaccinationVM.vacTypes.map((type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          onTap: () {
                            vaccinationVM.type.value = type;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(type),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.date,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => CustomTextfield(
                      hintText: vaccinationVM.dateController.value.text == ''
                          ? AppStrings.dateFormat
                          : vaccinationVM.dateController.value.text,
                      obscureText: false,
                      isError: vaccinationVM.dateError.value,
                      keyboardType: TextInputType.none,
                      controller: vaccinationVM.dateController.value,
                      focusNode: vaccinationVM.dateFocusNode.value,
                      onFieldSubmitted: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            vaccinationVM.dateFocusNode.value,
                            vaccinationVM.timeFocusNode.value);
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          vaccinationVM.selectDate(
                              context, vaccinationVM.dateController.value);
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
                          vaccinationVM.reminderTimeController.value.text == ''
                              ? AppStrings.time
                              : vaccinationVM.timeController.value.text,
                      keyboardType: TextInputType.none,
                      isError: vaccinationVM.timeError.value,
                      controller: vaccinationVM.timeController.value,
                      focusNode: vaccinationVM.timeFocusNode.value,
                      onFieldSubmitted: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            vaccinationVM.timeFocusNode.value,
                            vaccinationVM.notesFocusNode.value);
                      },
                      obscureText: false,
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          await vaccinationVM.selectTime(
                              context, vaccinationVM.timeController.value);
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
                    onFieldSubmitted: (p0) {
                      Utils.fieldFocusChange(
                          context,
                          vaccinationVM.notesFocusNode.value,
                          vaccinationVM.reminderDateFocusNode.value);
                    },
                    controller: vaccinationVM.notesController.value,
                    focusNode: vaccinationVM.notesFocusNode.value,
                  ),
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
                  // const SizedBox(
                  //   height: 18,
                  // ),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text(
                  //     AppStrings.doze,
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
                      AppStrings.addFiles,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      AlternatingButton(
                        title: AppStrings.photo,
                        outlined: false,
                        onPress: () async {
                          await vaccinationVM.pickMultipleImages();
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
                        title: AppStrings.files,
                        outlined: true,
                        onPress: () async {
                          await vaccinationVM.pickMultipleFiles();
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
                      AppStrings.yourDoc,
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
                            decoration: vaccinationVM.expertError.value
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
                                AppStrings.selectDoc,
                                style: Styles.choosePageText(),
                              ),
                              onTap: () {
                                Get.toNamed(RouteName.selectExpertPage);
                              },
                            ),
                          )
                        : ExpertItem(
                            expertis: AppStrings.trainExpert,
                            filledBtnTitle: '',
                            name: expertVM.name.value,
                            url: expertVM.url.value,
                          ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Text(
                    AppStrings.reminderNoti,
                    style: Styles.expertSignupPaget1(),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.date,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => CustomTextfield(
                      hintText:
                          vaccinationVM.reminderDateController.value.text == ''
                              ? AppStrings.dateFormat
                              : vaccinationVM.reminderDateController.value.text,
                      obscureText: false,
                      keyboardType: TextInputType.none,
                      controller: vaccinationVM.reminderDateController.value,
                      focusNode: vaccinationVM.reminderDateFocusNode.value,
                      onFieldSubmitted: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            vaccinationVM.reminderDateFocusNode.value,
                            vaccinationVM.reminderTimeFocusNode.value);
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          vaccinationVM.selectDate(context,
                              vaccinationVM.reminderDateController.value);
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
                          vaccinationVM.reminderTimeController.value.text == ''
                              ? AppStrings.time
                              : vaccinationVM.reminderTimeController.value.text,
                      // keyboardType: TextInputType.none,
                      controller: vaccinationVM.reminderTimeController.value,
                      focusNode: vaccinationVM.reminderTimeFocusNode.value,
                      onFieldSubmitted: (p0) {},
                      obscureText: false,
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          await vaccinationVM.selectTime(context,
                              vaccinationVM.reminderTimeController.value);
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
                  //       AppStrings.sendNoti,
                  //       style: Styles.expertSignupPaget1(),
                  //     )
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Obx(() => PrimartyButton(
                      title: AppStrings.request,
                      loading: vaccinationVM.loading.value,
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      height: 10,
                      onTap: () async {
                        vaccinationVM.dogId.value = doc['dogId'];
                        vaccinationVM.expertId.value = expertVM.id.value;
                        await vaccinationVM.addVaccination();
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

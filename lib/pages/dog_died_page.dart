import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/died_dog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../components/appbar.dart';
import '../components/primary_btn.dart';
import '../components/textfield.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';

class DogDiedPage extends StatelessWidget {
  const DogDiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final diedVM = Get.put(DiedDogModel());
    final QueryDocumentSnapshot<Object> arguments = Get.arguments;
    final doc = arguments;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.dogDied),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.reason,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextfield(
                      hintText: AppStrings.typeReason,
                      obscureText: false,
                      controller: diedVM.reasonController.value,
                      focusNode: diedVM.reasonFocusNode.value,
                      onFieldSubmitted: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            diedVM.reasonFocusNode.value,
                            diedVM.birthDateFocusNode.value);
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.dateOfBirth,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextfield(
                      hintText: AppStrings.dateFormat,
                      obscureText: false,
                      controller: diedVM.birthDateController.value,
                      focusNode: diedVM.birthDateFocusNode.value,
                      onFieldSubmitted: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            diedVM.birthDateFocusNode.value,
                            diedVM.deathDateFocusNode.value);
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          diedVM.selectDate(
                              context, diedVM.birthDateController);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            AssetImages.dateIcon,
                            colorFilter: const ColorFilter.mode(
                                AppColors.primaryColor, BlendMode.srcIn),
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
                        AppStrings.deathDate,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextfield(
                      hintText: AppStrings.dateFormat,
                      obscureText: false,
                      keyboardType: TextInputType.none,
                      controller: diedVM.deathDateController.value,
                      focusNode: diedVM.deathDateFocusNode.value,
                      onFieldSubmitted: (p0) {
                        Utils.fieldFocusChange(
                            context,
                            diedVM.deathDateFocusNode.value,
                            diedVM.notesFocusNode.value);
                      },
                      suffixIcon: GestureDetector(
                        onTap: () {
                          diedVM.selectDate(
                              context, diedVM.deathDateController);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            AssetImages.dateIcon,
                            colorFilter: const ColorFilter.mode(
                                AppColors.primaryColor, BlendMode.srcIn),
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
                      keyboardType: TextInputType.none,
                      controller: diedVM.notesController.value,
                      focusNode: diedVM.notesFocusNode.value,
                      onFieldSubmitted: (p0) {},
                    ),
                  ],
                ),
              ),
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
            //       AppStrings.sendArchive,
            //       style: Styles.expertSignupPaget1(),
            //     )
            //   ],
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
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
            //       AppStrings.dontShow,
            //       style: Styles.expertSignupPaget1(),
            //     )
            //   ],
            // ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => PrimartyButton(
                  title: AppStrings.save,
                  width: MediaQuery.sizeOf(context).width * 0.81,
                  height: 10,
                  onTap: () {
                    diedVM.addReason(doc['dogId']);
                  },
                  loading: diedVM.loading.value,
                  icon: ''),
            ),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      )),
    );
  }
}

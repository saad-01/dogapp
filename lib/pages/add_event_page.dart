import 'package:dogapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/appbar.dart';
import '../components/primary_btn.dart';
import '../components/textfield.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';
import '../view_models/add_event_model.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final doc = Get.arguments;
  final addVM = Get.put(AddEventModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.addEvent.tr),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.title.tr,
                          style: Styles.expertSignupPaget1(),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => CustomTextfield(
                          hintText: AppStrings.giveTitle.tr,
                          obscureText: false,
                          isError: addVM.titleError.value,
                          controller: addVM.titleController.value,
                          focusNode: addVM.titleFocusNode.value,
                          onFieldSubmitted: (p0) {
                            Utils.fieldFocusChange(
                                context,
                                addVM.titleFocusNode.value,
                                addVM.subTitleFocusNode.value);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.subTitle.tr,
                          style: Styles.expertSignupPaget1(),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => CustomTextfield(
                          hintText: AppStrings.giveSubTitle.tr,
                          obscureText: false,
                          isError: addVM.subTitleError.value,
                          controller: addVM.subTitleController.value,
                          focusNode: addVM.subTitleFocusNode.value,
                          onFieldSubmitted: (p0) {
                            Utils.fieldFocusChange(
                                context,
                                addVM.subTitleFocusNode.value,
                                addVM.dateFocusNode.value);
                          },
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
                          hintText: addVM.dateController.value.text == ''
                              ? AppStrings.dateFormat.tr
                              : addVM.dateController.value.text,
                          obscureText: false,
                          isError: addVM.dateError.value,
                          controller: addVM.dateController.value,
                          focusNode: addVM.dateFocusNode.value,
                          onFieldSubmitted: (p0) {
                            Utils.fieldFocusChange(
                                context,
                                addVM.dateFocusNode.value,
                                addVM.timeFocusNode.value);
                          },
                          suffixIcon: GestureDetector(
                            onTap: () {
                              addVM.selectDate(context);
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
                          hintText: '11 - 12',
                          obscureText: false,
                          isError: addVM.timeError.value,
                          controller: addVM.timeController.value,
                          focusNode: addVM.timeFocusNode.value,
                          onFieldSubmitted: (p0) {
                            Utils.fieldFocusChange(
                                context,
                                addVM.timeFocusNode.value,
                                addVM.locationFocusNode.value);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.location.tr,
                          style: Styles.expertSignupPaget1(),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(
                        () => CustomTextfield(
                          hintText: AppStrings.addLocation.tr,
                          obscureText: false,
                          isError: addVM.locationError.value,
                          controller: addVM.locationController.value,
                          focusNode: addVM.locationFocusNode.value,
                          onFieldSubmitted: (p0) {
                            Utils.fieldFocusChange(
                                context,
                                addVM.locationFocusNode.value,
                                addVM.locationFocusNode.value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
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
                      //       AppStrings.visibleToParent.tr,
                      //       style: Styles.expertSignupPaget1(),
                      //     )
                      //   ],
                      // ),

                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() => PrimartyButton(
                          title: AppStrings.addEvent.tr,
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 10,
                          loading: addVM.loading.value,
                          onTap: () async {
                            await addVM.addEvent();
                          },
                          icon: '')),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}

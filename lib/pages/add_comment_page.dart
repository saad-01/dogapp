import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/add_cmnt_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/appbar.dart';
import '../components/primary_btn.dart';
import '../components/textfield.dart';
import '../utils/app_colors.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class AddCommentPage extends StatefulWidget {
  const AddCommentPage({super.key});

  @override
  State<AddCommentPage> createState() => _AddCommentPageState();
}

class _AddCommentPageState extends State<AddCommentPage> {
  final doc = Get.arguments;
  final addVM = Get.put(AddCmntModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.addComment.tr),
            Expanded(
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
                              addVM.cmntFocusNode.value);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 18,
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
                    Obx(
                      () => CustomTextfield(
                        hintText: AppStrings.makeAnnouncement.tr,
                        obscureText: false,
                        isError: addVM.cmntError.value,
                        controller: addVM.cmntController.value,
                        focusNode: addVM.cmntFocusNode.value,
                        onFieldSubmitted: (p0) {
                          Utils.fieldFocusChange(
                              context,
                              addVM.cmntFocusNode.value,
                              addVM.cmntFocusNode.value);
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
                      height: 25,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Obx(
                            () => Checkbox(
                              value: addVM.checkbox.value,
                              onChanged: (value) {
                                addVM.checkbox.value = value!;
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
                          AppStrings.sendNoti.tr,
                          style: Styles.expertSignupPaget1(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => PrimartyButton(
                        title: AppStrings.share.tr,
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 10,
                        loading: addVM.loading.value,
                        onTap: () async {
                          await addVM.addCmnt(doc['id']);
                        },
                        icon: '')),
                  ],
                )
              ],
            ))
          ],
        ),
      )),
    );
  }
}

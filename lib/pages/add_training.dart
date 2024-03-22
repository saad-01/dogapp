import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/day_widget.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/select_field.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/add_training_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/alternating_btn.dart';
import '../components/textfield.dart';
import '../utils/styles.dart';

class AddTrainingPage extends StatefulWidget {
  const AddTrainingPage({super.key});

  @override
  State<AddTrainingPage> createState() => _AddTrainingPageState();
}

class _AddTrainingPageState extends State<AddTrainingPage> {
  final vm = Get.put(AddTrainingModel());
  final doc = Get.arguments;
  @override
  void initState() {
    vm.textFields.add(TextEditingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomAppBar(title: AppStrings.createTraining.tr),
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
                        AppStrings.trainingTitle.tr,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => CustomTextfield(
                        hintText: AppStrings.giveTraining.tr,
                        obscureText: false,
                        focusNode: vm.titleFocusNode.value,
                        isError: vm.titleError.value,
                        controller: vm.titleController.value,
                        onFieldSubmitted: (p0) {
                          Utils.fieldFocusChange(context,
                              vm.titleFocusNode.value, vm.noteFocusNode.value);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.trainingNote.tr,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => CustomTextfield(
                        hintText: AppStrings.shortNote.tr,
                        obscureText: false,
                        focusNode: vm.noteFocusNode.value,
                        controller: vm.noteController.value,
                        onFieldSubmitted: (p0) {
                          Utils.fieldFocusChange(context,
                              vm.noteFocusNode.value, vm.lengthFocusNode.value);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.trainLength.tr,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(() => CustomTextfield(
                          hintText: '00:00:00',
                          obscureText: false,
                          focusNode: vm.lengthFocusNode.value,
                          isError: vm.lengthError.value,
                          controller: vm.lengthController.value,
                          onFieldSubmitted: (p0) {
                            Utils.fieldFocusChange(
                                context,
                                vm.lengthFocusNode.value,
                                vm.equipmentFocusNode.value);
                          },
                        )),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.neededEquipment.tr,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(() => CustomTextfield(
                          hintText: AppStrings.listDown.tr,
                          obscureText: false,
                          focusNode: vm.equipmentFocusNode.value,
                          isError: vm.equipmentError.value,
                          controller: vm.equipmentController.value,
                          onFieldSubmitted: (p0) {},
                        )),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.trainingLevel.tr,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => SelectTextfield(
                        hintText: AppStrings.selectLevel,
                        val: vm.level.value,
                        isError: vm.levelError.value,
                        items: [
                          DropdownMenuItem(
                              value: 'Easy',
                              onTap: () {
                                vm.level.value = "Easy";
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppStrings.lblEasy.tr),
                                ],
                              )),
                          DropdownMenuItem(
                              value: 'Medium',
                              onTap: () {
                                vm.level.value = "Medium";
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppStrings.medium.tr),
                                ],
                              )),
                          DropdownMenuItem(
                              value: 'Difficult',
                              onTap: () {
                                vm.level.value = "Difficult";
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppStrings.difficult.tr),
                                ],
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.eligibility.tr,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => CustomTextfield(
                        hintText: AppStrings.hintEligibilty.tr,
                        obscureText: false,
                        controller: vm.eligiblilityController.value,
                        focusNode: vm.eligibilityFocusNode.value,
                        isError: vm.eligibleError.value,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.category.tr,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => SelectTextfield(
                        hintText: AppStrings.selectCategory,
                        val: vm.category.value,
                        isError: vm.categoryError.value,
                        items: [
                          DropdownMenuItem(
                              value: 'Exercise',
                              onTap: () {
                                vm.category.value = "Exercise";
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppStrings.excercise.tr),
                                ],
                              )),
                          DropdownMenuItem(
                              value: 'Game',
                              onTap: () {
                                vm.category.value = "Game";
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppStrings.games.tr),
                                ],
                              )),
                          DropdownMenuItem(
                              value: 'Manners',
                              onTap: () {
                                vm.category.value = "Manners";
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(AppStrings.goodManners.tr),
                                ],
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(
                      color: AppColors.dividerColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(AppStrings.material.tr,
                        style: Styles.expertSignupPageH1()),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: ShapeDecoration(
                        color: const Color(0xfffafbfb),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            color:
                                Colors.black.withOpacity(0.11999999731779099),
                          ),
                          borderRadius: BorderRadius.circular(10),
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
                      child: TabBar(
                        unselectedLabelColor: AppColors.black,
                        labelColor: AppColors.white,
                        unselectedLabelStyle: Styles.expertSignupPaget1(),
                        labelStyle: Styles.white16UTxt(),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        indicatorColor: AppColors.primaryColor,
                        splashBorderRadius: BorderRadius.circular(10),
                        onTap: (value) {
                          if (value == 0) {
                            vm.subCategory.value = 'dayByDay';
                          } else {
                            vm.subCategory.value = 'general';
                          }
                          print("This is value: ${vm.subCategory.value}");
                        },
                        tabs: <Widget>[
                          Tab(
                            text: AppStrings.dayByday.tr,
                          ),
                          Tab(
                            text: AppStrings.general.tr,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 486,
                      child: TabBarView(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    vm.textFields.add(TextEditingController());
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          SvgPicture.asset(AssetImages.addIcon),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Obx(() => Column(
                                      children: [
                                        for (var i = 0;
                                            i < vm.textFields.length;
                                            i++)
                                          DayWidget(
                                              title: '${i + 1}',
                                              controller: vm.textFields[i])
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(children: [
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
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: ShapeDecoration(
                                    color: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          width: 0.50,
                                          color: Color(0x3F737373)),
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
                                  child: TextField(
                                    maxLines: null,
                                    controller: vm.descriptionController.value,
                                    focusNode: vm.descriptionFocusNode.value,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: Styles.expertSignupPaget2(),
                                        hintText:
                                            AppStrings.giveDescription.tr),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppStrings.uploadFiles.tr,
                                  style: Styles.expertSignupPaget1(),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  AlternatingButton(
                                    title: AppStrings.media.tr,
                                    outlined: false,
                                    width: 139,
                                    height: 54,
                                    icon: AssetImages.galleryIcon,
                                    withIcon: true,
                                    onPress: () async {
                                      await vm.pickMultipleImages();
                                    },
                                    style: Styles.white16(),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  AlternatingButton(
                                    title: AppStrings.files.tr,
                                    outlined: true,
                                    width: 139,
                                    height: 54,
                                    icon: AssetImages.fileIcon,
                                    withIcon: true,
                                    onPress: () async {
                                      await vm.pickMultipleFiles();
                                    },
                                    style: Styles.primaryText(),
                                  ),
                                ],
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => PrimartyButton(
                          title: AppStrings.post.tr,
                          width: MediaQuery.sizeOf(context).width * 0.75,
                          height: 10,
                          loading: vm.loading.value,
                          onTap: () async {
                            await vm.addTraining(doc['dogId']);
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
      ),
    );
  }
}

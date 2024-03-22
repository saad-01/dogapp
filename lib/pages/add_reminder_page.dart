import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/view_models/add_reminder_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/select_field.dart';
import '../components/textfield.dart';
import '../utils/styles.dart';

class AddReminderPage extends StatefulWidget {
  const AddReminderPage({super.key});

  @override
  State<AddReminderPage> createState() => _AddReminderPageState();
}

class _AddReminderPageState extends State<AddReminderPage> {
  final vm = Get.put(AddReminderModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.addReminder.tr),
            Expanded(
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(AppStrings.reminderName.tr,
                          style: Styles.expertSignupPaget1())),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() => CustomTextfield(
                    hintText: AppStrings.typeName.tr,
                    controller: vm.nameController.value,
                    focusNode: vm.nameFocusNode.value,
                    isError: vm.nameError.value,
                    obscureText: false,
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(AppStrings.timeHeading.tr,
                          style: Styles.expertSignupPaget1())),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(
                    () => CustomTextfield(
                      hintText: vm.timeController.value.text == ''
                          ? AppStrings.time.tr
                          : vm.timeController.value.text,
                      obscureText: false,
                      isError: vm.timeError.value,
                      controller: vm.timeController.value,
                      focusNode: vm.timeFocusNode.value,
                      onFieldSubmitted: (p0) {
                        // Utils.fieldFocusChange(
                        //     context,
                        //     vm.timeFocusNode.value,
                        //     vm.notesFocusNode.value);
                      },
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          await vm.selectTime(
                              context, vm.timeController.value);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: SvgPicture.asset(AssetImages.outlineWatch),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppStrings.repeat.tr,
                        style: Styles.expertSignupPaget1()),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SelectTextfield(
                    val: vm.repeat.value,
                    hintText: '',
                    items: [
                      DropdownMenuItem(
                          value: 'Daily', child: Text(AppStrings.daily),onTap: () {
                            vm.repeat.value = 'Daily';
                          },),
                      DropdownMenuItem(
                          value: 'Once', child: Text(AppStrings.once),onTap: () {
                            vm.repeat.value = 'Once';
                          },),
                    ],
                  ),
                  const Spacer(),
                  PrimartyButton(
                      title: AppStrings.sett.tr,
                      width: 270,
                      height: 12,
                      icon: ''),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

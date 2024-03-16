import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/select_field.dart';
import '../components/textfield.dart';
import '../utils/styles.dart';

class AddReminderPage extends StatelessWidget {
  const AddReminderPage({super.key});

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
                  const CustomTextfield(
                    hintText: "Dogs race",
                    obscureText: false,
                  ),
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
                  CustomTextfield(
                    hintText: AppStrings.typeTime.tr,
                    obscureText: false,
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
                  const SelectTextfield(
                    val: 'Daily',
                    hintText: '',
                    items: [
                      DropdownMenuItem(value: 'Daily', child: Text('Daily')),
                      DropdownMenuItem(value: 'Once', child: Text('Once')),
                      DropdownMenuItem(
                          value: 'After two days',
                          child: Text('After two days')),
                      DropdownMenuItem(
                          value: 'Mon to Fri', child: Text('Mon to Fri')),
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

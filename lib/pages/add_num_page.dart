import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';

class AddNumPage extends StatelessWidget {
  const AddNumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.addNum),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.name,
                style: Styles.expertSignupPaget1(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomTextfield(
                hintText: AppStrings.typeName, obscureText: false),
            const SizedBox(
              height: 18,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.yourNumber,
                style: Styles.expertSignupPaget1(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomTextfield(
                hintText: AppStrings.typeNum, obscureText: false),
            const SizedBox(
              height: 18,
            ),
            const Spacer(),
            const PrimartyButton(
                title: AppStrings.upload, width: 150, height: 12, icon: ''),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}

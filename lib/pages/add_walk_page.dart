import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';

class AddWalkPage extends StatelessWidget {
  const AddWalkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.addManual),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.distance,
                style: Styles.expertSignupPaget1(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomTextfield(hintText: '00Km', obscureText: false),
            const SizedBox(
              height: 18,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.duration,
                style: Styles.expertSignupPaget1(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const CustomTextfield(hintText: '00:00:00', obscureText: false),
            const Spacer(),
            PrimartyButton(
                title: AppStrings.save,
                width: MediaQuery.sizeOf(context).width * 0.75,
                height: 12,
                icon: ''),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}

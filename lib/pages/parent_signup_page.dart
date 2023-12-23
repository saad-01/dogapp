import 'package:dogapp/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/primary_btn.dart';
import '../components/textfield.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class ParentSignupPage extends StatefulWidget {
  const ParentSignupPage({super.key});

  @override
  State<ParentSignupPage> createState() => _ParentSignupPageState();
}

class _ParentSignupPageState extends State<ParentSignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                AppStrings.setProfileExpert,
                style: Styles.expertSignupPageH1(),
              ),
              const SizedBox(
                height: 50,
              ),
              SvgPicture.asset(AssetImages.expertIcon),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetImages.addIcon),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    AppStrings.uploadYourPhoto,
                    style: Styles.expertSignupPageH2(),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  AppStrings.yourName,
                  style: Styles.expertSignupPaget1(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const CustomTextfield(
                hintText: AppStrings.typeYourname,
                obscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.dateOfBirth,
                      style: Styles.expertSignupPaget1())),
              const SizedBox(
                height: 8,
              ),
              CustomTextfield(
                hintText: AppStrings.dateFormat,
                obscureText: false,
                keyboardType: TextInputType.number,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(15),
                  child: SvgPicture.asset(AssetImages.dateIcon),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.yourMail,
                      style: Styles.expertSignupPaget1())),
              const SizedBox(
                height: 8,
              ),
              const CustomTextfield(
                hintText: AppStrings.typeYourMail,
                obscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.yourPassword,
                      style: Styles.expertSignupPaget1())),
              const SizedBox(
                height: 8,
              ),
              const CustomTextfield(
                hintText: AppStrings.typePassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.yourNumber,
                      style: Styles.expertSignupPaget1())),
              const SizedBox(
                height: 8,
              ),
              const CustomTextfield(
                hintText: AppStrings.typeNumber,
                obscureText: false,
              ),
              const SizedBox(
                height: 60,
              ),
              PrimartyButton(
                title: AppStrings.createButton,
                width: 120,
                height: 10,
                onTap: () {
                  Get.offAllNamed(RouteName.parentDashboardPage);
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      )),
    );
  }
}

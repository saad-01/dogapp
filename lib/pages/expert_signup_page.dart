import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpertSignupPage extends StatefulWidget {
  const ExpertSignupPage({super.key});

  @override
  State<ExpertSignupPage> createState() => _ExpertSignupPageState();
}

class _ExpertSignupPageState extends State<ExpertSignupPage> {
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
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(AppStrings.expertQualification,
                    style: Styles.expertSignupPaget1()),
              ),
              const SizedBox(
                height: 8,
              ),
              const CustomTextfield(
                hintText: AppStrings.typeQualification,
                obscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(AppStrings.expertSpeciality,
                    style: Styles.expertSignupPaget1()),
              ),
              const SizedBox(
                height: 8,
              ),
              const CustomTextfield(
                hintText: AppStrings.typeSpeciality,
                obscureText: false,
              ),
              const SizedBox(
                height: 60,
              ),
              PrimartyButton(
                title: AppStrings.createButton,
                width: 120,
                height: 10,
                onTap: () {},
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

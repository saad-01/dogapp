import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/select_field.dart';
import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddDogPage extends StatelessWidget {
  const AddDogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // String selectedOption = '';
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
                AppStrings.setProfile,
                style: Styles.expertSignupPageH1(),
              ),
              const SizedBox(
                height: 50,
              ),
              SvgPicture.asset(AssetImages.uploadDog),
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
                    AppStrings.uploadDog,
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
                  AppStrings.dogsName,
                  style: Styles.expertSignupPaget1(),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const CustomTextfield(
                hintText: AppStrings.typeDogName,
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
                  child: Text(AppStrings.breed,
                      style: Styles.expertSignupPaget1())),
              const SizedBox(
                height: 8,
              ),
              CustomTextfield(
                hintText: AppStrings.selectBreed,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SvgPicture.asset(AssetImages.nextBlackIcon),
                ),
                obscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.weight,
                      style: Styles.expertSignupPaget1())),
              const SizedBox(
                height: 8,
              ),
              const CustomTextfield(
                hintText: AppStrings.typeWeight,
                obscureText: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.gender,
                      style: Styles.expertSignupPaget1())),
              const SizedBox(
                height: 8,
              ),
              SelectTextfield(
                val: '',
                hintText: AppStrings.typeGender,
                items: [
                  DropdownMenuItem(
                      value: 'Male',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(AppStrings.male),
                          SvgPicture.asset(AssetImages.male)
                        ],
                      )),
                  DropdownMenuItem(
                      value: 'Female',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(AppStrings.female),
                          SvgPicture.asset(AssetImages.female)
                        ],
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(AppStrings.neutered,
                    style: Styles.expertSignupPaget1()),
              ),
              const SizedBox(
                height: 8,
              ),
              const SelectTextfield(
                val: 'No',
                hintText: '',
                items: [
                  DropdownMenuItem(value: 'Yes', child: Text('Yes')),
                  DropdownMenuItem(value: 'No', child: Text('NO')),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:
                    Text(AppStrings.color, style: Styles.expertSignupPaget1()),
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTextfield(
                hintText: AppStrings.typeColor,
                obscureText: false,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SvgPicture.asset(AssetImages.dropDown),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(AppStrings.microChipNum,
                    style: Styles.expertSignupPaget1()),
              ),
              const SizedBox(
                height: 8,
              ),
              const CustomTextfield(
                hintText: AppStrings.typeChipNumber,
                obscureText: false,
              ),
              const SizedBox(
                height: 60,
              ),
              PrimartyButton(
                icon: '',
                title: AppStrings.createButton,
                width: MediaQuery.sizeOf(context).width * 0.8,
                height: 10,
                onTap: () {
                  Get.back();
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

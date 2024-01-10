import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/textfield.dart';
import '../utils/styles.dart';

class AddFoodPage extends StatelessWidget {
  const AddFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.addFood),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(AssetImages.dogFood),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    width: 60,
                    child: Divider(
                      color: Color(0xFFA8A8A8),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.foodName,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomTextfield(
                    hintText: AppStrings.typeFood,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.timeHeading,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextfield(
                    hintText: AppStrings.time,
                    obscureText: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SvgPicture.asset(AssetImages.outlineWatch),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.notes,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomTextfield(
                    hintText: AppStrings.typeNotes,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.foodOutside,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextfield(
                    hintText: 'Mon',
                    obscureText: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SvgPicture.asset(AssetImages.selectFieldIcon),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.weight,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomTextfield(
                    hintText: '00:00 KG',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    AppStrings.reminderNoti,
                    style: Styles.expertSignupPaget1(),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.day,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextfield(
                    hintText: 'Mon to Fri',
                    obscureText: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SvgPicture.asset(AssetImages.selectFieldIcon),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.timeHeading,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextfield(
                    hintText: AppStrings.time,
                    obscureText: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: SvgPicture.asset(AssetImages.outlineWatch),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  PrimartyButton(
                      title: AppStrings.save,
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      height: 10,
                      icon: ''),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}
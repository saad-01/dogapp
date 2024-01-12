import 'package:dogapp/components/alternating_btn.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/select_field.dart';
import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CreateMissingReport extends StatelessWidget {
  const CreateMissingReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.missingReport),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                          child: Text(AppStrings.age,
                              style: Styles.expertSignupPaget1())),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextfield(
                        hintText: '1 to 3 years',
                        obscureText: false,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SvgPicture.asset(AssetImages.dropDown),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(AppStrings.male),
                                  SvgPicture.asset(AssetImages.male)
                                ],
                              )),
                          DropdownMenuItem(
                              value: 'Female',
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                        child: Text(AppStrings.color,
                            style: Styles.expertSignupPaget1()),
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
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(AppStrings.lostDate,
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
                        height: 40,
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
                          child: Text(AppStrings.yourAddress,
                              style: Styles.expertSignupPaget1())),
                      const SizedBox(
                        height: 8,
                      ),
                      const CustomTextfield(
                        hintText: AppStrings.typeAddress,
                        obscureText: false,
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
                          child: Text(AppStrings.notes,
                              style: Styles.expertSignupPaget1())),
                      const SizedBox(
                        height: 8,
                      ),
                      const CustomTextfield(
                        hintText: AppStrings.typeNotes,
                        obscureText: false,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(AppStrings.multiplePhotos,
                          style: Styles.expertSignupPaget1()),
                      const SizedBox(
                        height: 15,
                      ),
                      AlternatingButton(
                          title: AppStrings.photo,
                          outlined: false,
                          width: 140,
                          height: 54,
                          icon: AssetImages.galleryIcon,
                          style: Styles.white16(),
                          withIcon: true),
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    width: 1,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: Color(0xFF018383),
                                  ),
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            AppStrings.sendNotiAll,
                            style: Styles.expertSignupPaget1(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PrimartyButton(
                        icon: '',
                        title: AppStrings.share,
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: 10,
                        onTap: () {
                          Get.toNamed(RouteName.missingDogsPage);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

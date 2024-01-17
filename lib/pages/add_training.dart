import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/alternating_btn.dart';
import '../components/textfield.dart';
import '../utils/styles.dart';

class AddTrainingPage extends StatelessWidget {
  const AddTrainingPage({super.key});

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
              const CustomAppBar(title: AppStrings.createTraining),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
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
                          AppStrings.uploadPhoto,
                          style: Styles.expertSignupPageH2(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.trainingTitle,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomTextfield(
                      hintText: AppStrings.giveTraining,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.trainingNote,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomTextfield(
                      hintText: AppStrings.shortNote,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.trainLength,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomTextfield(
                      hintText: '00:00:00',
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.neededEquipment,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomTextfield(
                      hintText: AppStrings.listDown,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.trainingLevel,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextfield(
                      hintText: 'Easy',
                      obscureText: false,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SvgPicture.asset(AssetImages.dropDown),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.eligibility,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomTextfield(
                      hintText: AppStrings.hintEligibilty,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.category,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextfield(
                      hintText: 'Exercise',
                      obscureText: false,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SvgPicture.asset(AssetImages.dropDown),
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
                    Text(AppStrings.material,
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
                        tabs: const <Widget>[
                          Tab(
                            text: AppStrings.dayByday,
                          ),
                          Tab(
                            text: AppStrings.general,
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
                                Container(
                                  height: 69,
                                  decoration: ShapeDecoration(
                                    color: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.50,
                                        color: AppColors.black
                                            .withOpacity(0.11999999731779099),
                                      ),
                                      borderRadius: BorderRadius.circular(6),
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
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(AssetImages.day),
                                            const SizedBox(
                                              width: 18,
                                            ),
                                            Text(
                                              "Day 1",
                                              style: Styles.appBarH1(),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SvgPicture.asset(
                                              AssetImages.primaryDown),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 20),
                                  decoration: ShapeDecoration(
                                    color: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.50,
                                        color: AppColors.black
                                            .withOpacity(0.11999999731779099),
                                      ),
                                      borderRadius: BorderRadius.circular(6),
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
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(AssetImages.day),
                                              const SizedBox(
                                                width: 18,
                                              ),
                                              Text(
                                                "Day 1",
                                                style: Styles.appBarH1(),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                                AssetImages.addIcon),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          AppStrings.description,
                                          style: Styles.expertSignupPaget1(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: ShapeDecoration(
                                          color: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                width: 0.50,
                                                color: Color(0x3F737373)),
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                          maxLines: 5,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintStyle:
                                                  Styles.expertSignupPaget2(),
                                              hintText:
                                                  AppStrings.giveDescription),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          AppStrings.uploadFiles,
                                          style: Styles.expertSignupPaget1(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          AlternatingButton(
                                            title: AppStrings.media,
                                            outlined: false,
                                            width: 139,
                                            height: 54,
                                            icon: AssetImages.galleryIcon,
                                            withIcon: true,
                                            style: Styles.white16(),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          AlternatingButton(
                                            title: AppStrings.files,
                                            outlined: true,
                                            width: 139,
                                            height: 54,
                                            icon: AssetImages.fileIcon,
                                            withIcon: true,
                                            style: Styles.primaryText(),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppStrings.description,
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
                                    maxLines: 5,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintStyle: Styles.expertSignupPaget2(),
                                        hintText: AppStrings.giveDescription),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppStrings.uploadFiles,
                                  style: Styles.expertSignupPaget1(),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  AlternatingButton(
                                    title: AppStrings.media,
                                    outlined: false,
                                    width: 139,
                                    height: 54,
                                    icon: AssetImages.galleryIcon,
                                    withIcon: true,
                                    style: Styles.white16(),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  AlternatingButton(
                                    title: AppStrings.files,
                                    outlined: true,
                                    width: 139,
                                    height: 54,
                                    icon: AssetImages.fileIcon,
                                    withIcon: true,
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
                    PrimartyButton(
                        title: AppStrings.post,
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
      ),
    );
  }
}

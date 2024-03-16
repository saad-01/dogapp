import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/pdf_file_item.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ExpertExDetailsPage extends StatelessWidget {
  const ExpertExDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.handFeeding.tr),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.description.tr,
                      style: Styles.appBarH1(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Lorem ipsum dolor sit amet consectetur. Massa sagittis eget enim mauris sem id diam in. Lorem ipsum dolor sit amet consectetur. Massa sagittis eget enim mauris sem id diam in. Lorem ipsum dolor sit amet consectetur. Massa sagittis eget enim mauris sem id diam in. Lorem ipsum dolor sit amet consectetur. Massa sagittis eget enim mauris sem id diam in. Lorem ipsum dolor sit amet consectetur. Massa sagittis eget enim mauris sem id diam in. Lorem ipsum dolor sit amet consectetur. Massa sagittis eget enim mauris sem id diam in.',
                      style: Styles.choosePageText(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.details.tr,
                      style: Styles.appBarH1(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFFD7D7D7)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: SvgPicture.asset(AssetImages.menu),
                    title: Text(
                      AppStrings.trainingLevel.tr,
                      style: Styles.black14(),
                    ),
                    trailing: SizedBox(
                      width: 50,
                      child: Row(
                        children: [
                          SvgPicture.asset(AssetImages.primaryCircle),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            AppStrings.easy.tr,
                            style: Styles.black14(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFFD7D7D7)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: SvgPicture.asset(AssetImages.alarm),
                    title: Text(
                      AppStrings.trainingLength.tr,
                      style: Styles.black14(),
                    ),
                    trailing: Text(
                      '3 min',
                      style: Styles.black14(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFFD7D7D7)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    leading: SvgPicture.asset(AssetImages.equipment),
                    title: Text(
                      AppStrings.equipment.tr,
                      style: Styles.black14(),
                    ),
                    trailing: Text(
                      'treats, clicker',
                      style: Styles.black14(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.articles.tr,
                      style: Styles.appBarH1(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PdfFileItem(),
                      PdfFileItem(),
                      PdfFileItem(),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.tutorial.tr,
                      style: Styles.appBarH1(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AssetImages.videoTutorial),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Image.asset(AssetImages.videoTutorial2)),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(AssetImages.slider),
                  const SizedBox(
                    height: 25,
                  ),
                  PrimartyButton(
                      title: AppStrings.editExercise.tr,
                      width: 250,
                      height: 12,
                      onTap: () {},
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

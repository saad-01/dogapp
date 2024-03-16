import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/expert_item.dart';

class DayByDayExPage extends StatelessWidget {
  const DayByDayExPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.trainingProgram.tr),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                   ExpertItem(
                      expertis: AppStrings.preparedByExpert.tr,
                      filledBtnTitle: AppStrings.seeProfileBtn.tr),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Day 1',
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
                    leading: SvgPicture.asset(
                      AssetImages.day,
                      height: 34,
                      width: 34,
                    ),
                    subtitle: Text(
                      AppStrings.trainingNotes.tr,
                      style: Styles.lightgrey8(),
                    ),
                    title: Text(
                      AppStrings.highFive.tr,
                      style: Styles.black14(),
                    ),
                    trailing: SvgPicture.asset(AssetImages.nextBlackIcon),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Day 2',
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
                    leading: SvgPicture.asset(
                      AssetImages.lock,
                    ),
                    subtitle: Text(
                      AppStrings.trainingNotes.tr,
                      style: Styles.lightgrey8(),
                    ),
                    title: Text(
                      AppStrings.highFive.tr,
                      style: Styles.black14(),
                    ),
                    trailing: SvgPicture.asset(AssetImages.nextBlackIcon),
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
                    leading: SvgPicture.asset(
                      AssetImages.lock,
                    ),
                    subtitle: Text(
                      AppStrings.trainingNotes.tr,
                      style: Styles.lightgrey8(),
                    ),
                    title: Text(
                      AppStrings.highFive.tr,
                      style: Styles.black14(),
                    ),
                    trailing: SvgPicture.asset(AssetImages.nextBlackIcon),
                  ),
                  const SizedBox(
                    height: 15,
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

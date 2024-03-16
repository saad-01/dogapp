import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/image_box.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectReportPage extends StatelessWidget {
  SelectReportPage({super.key});
  final bool editFlag = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CustomAppBar(
              title: AppStrings.selectReport.tr,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              AppStrings.whichRU.tr,
              style: Styles.appBarH1(),
            ),
            Text(
              editFlag ? AppStrings.wantToEdit.tr : AppStrings.wantRelease.tr,
              style: Styles.choosePageHeading(),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageBox(
                  imagePath: AssetImages.generalReport,
                  onPress: () {
                    if (editFlag) {
                      Get.toNamed(RouteName.reportEditPage);
                    } else {
                      Get.toNamed(RouteName.reportDetailsPage);
                    }
                  },
                  title: AppStrings.trainReport.tr,
                ),
                const SizedBox(
                  width: 40,
                ),
                ImageBox(
                  imagePath: AssetImages.dietReport,
                  onPress: () {
                    Get.toNamed(RouteName.listExpertPage);
                  },
                  title: AppStrings.physioReport.tr,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageBox(
                  imagePath: AssetImages.trainReport,
                  onPress: () {
                    Get.toNamed(RouteName.selectEditReport, arguments: true);
                  },
                  title: AppStrings.nutriReport.tr,
                ),
                const SizedBox(
                  width: 40,
                ),
                ImageBox(
                  imagePath: AssetImages.otherReport,
                  onPress: () {
                    Get.toNamed(
                      RouteName.selectExpertPage,
                    );
                  },
                  title: AppStrings.otherExpert.tr,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/image_box.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EmergencyReport extends StatelessWidget {
  const EmergencyReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(
              title: AppStrings.emergencyReport,
            ),
            const SizedBox(
              height: 20,
            ),
            SvgPicture.asset(AssetImages.report),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppStrings.whatYou.toUpperCase(),
              style: Styles.expertSignupPageH1(),
            ),
            Text(
              AppStrings.wantTo.toUpperCase(),
              style: Styles.choosePageHeading(),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageBox(
                  imagePath: AssetImages.dogBait,
                  onPress: () {
                    Get.toNamed(RouteName.dogBaitPage);
                  },
                  title: AppStrings.dogBait,
                ),
                const SizedBox(
                  width: 40,
                ),
                ImageBox(
                  imagePath: AssetImages.missReport,
                  onPress: () {
                    Get.toNamed(RouteName.missingDogsPage);
                  },
                  title: AppStrings.missingReport,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ImageBox(
                  imagePath: AssetImages.foundOne,
                  onPress: () {
                    Get.toNamed(RouteName.foundedDogsPage);
                  },
                  title: AppStrings.foundOne,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

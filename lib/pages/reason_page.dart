import 'package:dogapp/components/image_box.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/appbar.dart';
import '../routes/route_names.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';

class ReasonPage extends StatelessWidget {
  const ReasonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.deleteDog),
            Expanded(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.selectReason.toUpperCase(),
                      style: Styles.black28(),
                    ),
                    Text(
                      AppStrings.whyReason.toUpperCase(),
                      style: Styles.lightGrey12(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageBox(
                          imagePath: AssetImages.died,
                          onPress: () {
                            Get.toNamed(RouteName.dogDiedPage);
                          },
                          title: AppStrings.dogDied,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        ImageBox(
                          imagePath: AssetImages.otherReason,
                          onPress: () {
                            // Get.toNamed(RouteName.missReportPage);
                          },
                          title: AppStrings.otherReason,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  
  }
}

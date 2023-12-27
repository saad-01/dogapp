import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/image_box.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectExpertPage extends StatelessWidget {
  const SelectExpertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const CustomAppBar(
              title: AppStrings.selectExpert,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      AppStrings.whoRU,
                      style: Styles.appBarH1(),
                    ),
                    Text(
                      AppStrings.lookingFor,
                      style: Styles.choosePageHeading(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageBox(
                          imagePath: AssetImages.trainExpert,
                          onPress: () {
                            Get.toNamed(RouteName.expertSignupPage);
                          },
                          title: AppStrings.trainExpert,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        ImageBox(
                          imagePath: AssetImages.physioExpert,
                          onPress: () {
                            Get.toNamed(RouteName.expertSignupPage);
                          },
                          title: AppStrings.physioExpert,
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
                          imagePath: AssetImages.nutriExpert,
                          onPress: () {
                            Get.toNamed(RouteName.expertSignupPage);
                          },
                          title: AppStrings.nutriExpert,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        ImageBox(
                          imagePath: AssetImages.vetExpert,
                          onPress: () {
                            Get.toNamed(RouteName.expertSignupPage);
                          },
                          title: AppStrings.vetExpert,
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
                          imagePath: AssetImages.otherExpert,
                          onPress: () {
                            Get.toNamed(RouteName.expertSignupPage);
                          },
                          title: AppStrings.otherExpert,
                        ),
                        const SizedBox(
                          width: 170,
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

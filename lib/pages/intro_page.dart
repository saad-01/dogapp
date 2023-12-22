import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(fit: StackFit.loose, children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.7,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.sizeOf(context).height * 0.6,
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: const AssetImage(AssetImages.backgroundImage),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      AppColors.black.withOpacity(
                          0.319999992847442), // Adjust opacity as needed
                      BlendMode.darken,
                    ),
                  )),
                ),
                Positioned(
                    bottom: 0,
                    child: SvgPicture.asset(
                      AssetImages.introtxtBg,
                      height: MediaQuery.sizeOf(context).height * 0.5,
                    )),
                Positioned(
                    bottom: MediaQuery.sizeOf(context).height * 0.3,
                    left: 19,
                    child: Text(
                      AppStrings.firstSliderHeading,
                      style: Styles.sliderHeading(),
                    )),
                Positioned(
                    bottom: MediaQuery.sizeOf(context).height * 0.05,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                      ),
                      width: MediaQuery.sizeOf(context).width,
                      child: Text(
                        AppStrings.firstSliderText,
                        style: Styles.sliderText(),
                      ),
                    )),
                Positioned(
                    bottom: 10,
                    right: 10,
                    child: InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.chooseProfilePage);
                        },
                        child: const Text("Next")))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

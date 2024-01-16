import 'package:dogapp/components/alternating_btn.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class WalkRecordPage extends StatelessWidget {
  const WalkRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20.0),
            child: CustomAppBar(title: AppStrings.walkRecord),
          ),
          Expanded(
              child: Image.asset(
            AssetImages.mapDesign,
            fit: BoxFit.cover,
            width: MediaQuery.sizeOf(context).width,
          )),
          Stack(
            children: [
              Container(
                width: 430,
                height: 300,
                decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      color: AppColors.black.withOpacity(0.11999999731779099),
                    ),
                    borderRadius: BorderRadius.circular(8),
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AlternatingButton(
                          title: AppStrings.pause,
                          outlined: true,
                          width: 130,
                          height: 54,
                          withIcon: false,
                          style: Styles.primary20(),
                          onPress: () {},
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AlternatingButton(
                          title: AppStrings.stops,
                          outlined: false,
                          width: 130,
                          height: 54,
                          withIcon: false,
                          style: Styles.sliderText(),
                          onPress: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    AlternatingButton(
                      title: AppStrings.complete,
                      outlined: true,
                      width: 270,
                      height: 54,
                      withIcon: true,
                      icon: AssetImages.pause,
                      style: Styles.primaryText(),
                      onPress: () {
                        Get.toNamed(RouteName.walkCompletePage);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(AssetImages.duration),
                        Text(
                          "00:00:00",
                          style: Styles.primaryText().copyWith(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          AppStrings.duration,
                          style: Styles.expertSignupPaget1(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(AssetImages.distance),
                        Text(
                          "5,53km",
                          style: Styles.primaryText().copyWith(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          AppStrings.distance,
                          style: Styles.expertSignupPaget1(),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}

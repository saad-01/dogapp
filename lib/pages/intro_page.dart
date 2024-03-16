import 'package:dogapp/components/slider_btn.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  RxInt selectedItem = 0.obs;
  RxInt initialPage = 0.obs;
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
                    top: 10,
                    left: 20,
                    child: GestureDetector(
                      onTap: () {
                        Get.offNamed(RouteName.languagePage);
                      },
                      child: Container(
                        width: 151,
                        height: 39,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: AppColors.white,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              AssetImages.whiteGlobe,
                            ),
                            Text(AppStrings.lang.tr,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                )),
                            SvgPicture.asset(
                              AssetImages.whiteDropdown,
                            ),
                          ],
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 0,
                    child: SvgPicture.asset(
                      AssetImages.sliderItem,
                      height: MediaQuery.sizeOf(context).height * 0.55,
                    )),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.38,
                      child: Obx(
                        () => FlutterCarousel(
                            items: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.firstSliderHeading.tr,
                                      style: Styles.sliderHeading(),
                                    ),
                                    Text(
                                      AppStrings.firstSliderText.tr,
                                      style: Styles.sliderText(),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.sliderHeading2.tr,
                                      style: Styles.sliderHeading(),
                                    ),
                                    Text(
                                      AppStrings.slidertxt2.tr,
                                      style: Styles.sliderText(),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.sliderHeading3.tr,
                                      style: Styles.sliderHeading(),
                                    ),
                                    Text(
                                      AppStrings.slidertxt3.tr,
                                      style: Styles.sliderText(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                              initialPage: initialPage.value,
                              showIndicator: false,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                selectedItem.value = index;
                              },
                            )),
                      )),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Obx(
                        //   () => (selectedItem.value != 0)
                        //       ? SliderButton(
                        //           backFlag: true,
                        //           onPress: () {
                        //             initialPage.value = initialPage.value - 1;
                        //             print(initialPage.value);
                        //           },
                        //         )
                        //       : const SizedBox(
                        //           width: 50,
                        //         ),
                        // ),
                        const SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          height: 10,
                          child: ListView.builder(
                              itemCount: 3,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Obx(() => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 1.0, horizontal: 1),
                                      child: Container(
                                        width: (selectedItem.value == index)
                                            ? 14.0
                                            : 10.0,
                                        height: (selectedItem.value == index)
                                            ? 14.0
                                            : 10.0,
                                        decoration: ShapeDecoration(
                                            shape: const CircleBorder(),
                                            color: (selectedItem.value == index)
                                                ? AppColors.yellowColor
                                                : AppColors
                                                    .sliderUnselecteColors),
                                      ),
                                    ));
                              }),
                        ),
                        Obx(() => (selectedItem.value == 2)
                            ? SliderButton(
                                backFlag: false,
                                onPress: () {
                                  Get.offNamed(RouteName.languagePage);
                                },
                              )
                            : const SizedBox(
                                width: 100,
                                height: 40,
                              )),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

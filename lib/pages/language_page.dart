import 'package:dogapp/components/flag_item.dart';
import 'package:dogapp/components/intro_btn.dart';
import 'package:dogapp/view_models/language_model.dart';
import 'package:dogapp/view_models/services/localization.dart';
import 'package:flutter/material.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class SelectLanguagePage extends StatefulWidget {
  const SelectLanguagePage({super.key});

  @override
  State<SelectLanguagePage> createState() => _SelectLanguagePageState();
}

class _SelectLanguagePageState extends State<SelectLanguagePage> {
  final LanguageController controller = Get.put(LanguageController());
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
                      AppColors.black
                          .withOpacity(0.68), // Adjust opacity as needed
                      BlendMode.darken,
                    ),
                  )),
                ),
                Positioned(
                    child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          width: 107,
                          height: 107,
                          padding: const EdgeInsets.all(20),
                          decoration: ShapeDecoration(
                            color: AppColors.white
                                .withOpacity(0.07999999821186066),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1.50, color: Colors.white),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: SvgPicture.asset(
                            AssetImages.outlinedDog,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          AppStrings.selectLang.tr.toUpperCase(),
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      AssetImages.langPageItem,
                      height: MediaQuery.sizeOf(context).height * 0.72,
                      fit: BoxFit.cover,
                      width: MediaQuery.sizeOf(context).width,
                    )),
                Positioned(
                    bottom: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              AppTranslation.changeLocale('de');
                            },
                            child: LangaugeWidget(
                                selected: AppTranslation.locale ==
                                        const Locale('de', '')
                                    ? true
                                    : false,
                                img: AssetImages.german,
                                title: AppStrings.german.tr),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              AppTranslation.changeLocale('enUS');
                            },
                            child: LangaugeWidget(
                                selected: AppTranslation.locale ==
                                        const Locale('enUS', '')
                                    ? true
                                    : false,
                                img: AssetImages.english,
                                title: AppStrings.english.tr),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              AppTranslation.changeLocale('fr');
                            },
                            child: LangaugeWidget(
                                selected: AppTranslation.locale ==
                                        const Locale('fr', '')
                                    ? true
                                    : false,
                                img: AssetImages.french,
                                title: AppStrings.french.tr),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          IntroBtn(
                            title: AppStrings.next.tr,
                            clr: AppColors.yellowColor,
                            showIcon: false,
                            onPress: () {
                              Get.offNamed(RouteName.signupPage);
                            },
                          ),
                        ],
                      ),
                    ))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/primary_btn.dart';
import '../components/textfield.dart';

class DogBaitPage extends StatelessWidget {
  const DogBaitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(
              title: AppStrings.dogBait,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      AssetImages.dogBaitLg,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppStrings.warnParents.toUpperCase(),
                      style: Styles.expertSignupPageH1(),
                    ),
                    Text(
                      AppStrings.theDanger.toUpperCase(),
                      style: Styles.choosePageHeading(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.baitLocation,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextfield(
                      hintText: AppStrings.typeBaitLocation,
                      obscureText: false,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(AssetImages.location),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.notes,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomTextfield(
                      hintText: AppStrings.typeNotes,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteName.mapPage);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFFFDF4),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0x3F737373)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x0F000000),
                              blurRadius: 6,
                              offset: Offset(-2, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.seeMapView,
                              style: Styles.black14(),
                            ),
                            SvgPicture.asset(AssetImages.location)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFF018383),
                                ),
                                borderRadius: BorderRadius.circular(6)),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          AppStrings.sendNotiAll,
                          style: Styles.expertSignupPaget1(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimartyButton(
                        title: AppStrings.share,
                        width: MediaQuery.sizeOf(context).width * 0.75,
                        height: 10,
                        icon: ''),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

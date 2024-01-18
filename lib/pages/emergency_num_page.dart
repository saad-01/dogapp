import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';

class EmergencyNumPage extends StatelessWidget {
  const EmergencyNumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.emergencyNums),
            Container(
              // width: 364,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0x3F737373)),
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
                children: [
                  SvgPicture.asset(AssetImages.search),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: Styles.expertSignupPaget2(),
                          hintText: 'Search'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Animal Rescue',
                              style: Styles.expertSignupPaget1(),
                            ),
                            Text(
                              '+1000 0000 000',
                              style: Styles.expertSignupPaget1(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Animal Rescue',
                              style: Styles.expertSignupPaget1(),
                            ),
                            Text(
                              '+1000 0000 000',
                              style: Styles.expertSignupPaget1(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Animal Rescue',
                              style: Styles.expertSignupPaget1(),
                            ),
                            Text(
                              '+1000 0000 000',
                              style: Styles.expertSignupPaget1(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Animal Rescue',
                              style: Styles.expertSignupPaget1(),
                            ),
                            Text(
                              '+1000 0000 000',
                              style: Styles.expertSignupPaget1(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )),
            const Spacer(),
            PrimartyButton(
              title: AppStrings.addNum,
              width: 200,
              height: 10,
              icon: '',
              onTap: () {
                Get.toNamed(RouteName.addNumPage);
              },
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      )),
    );
  }
}

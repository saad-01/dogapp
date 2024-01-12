import 'package:dogapp/components/intro_dog.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/appbar.dart';
import '../components/primary_btn.dart';
import '../routes/route_names.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';

class MissingDogsPage extends StatelessWidget {
  const MissingDogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.missingDogs),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // width: 364,
                    height: 50,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: ShapeDecoration(
                      color: AppColors.white,
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
                  IntroDogWidget(
                    onPress: () {
                      Get.toNamed(RouteName.missDogProfilePage);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IntroDogWidget(
                    onPress: () {
                      Get.toNamed(RouteName.missDogProfilePage);
                    },
                  ),
                ],
              ),
            )),
            // const Spacer(),
            PrimartyButton(
              title: AppStrings.createReport,
              width: MediaQuery.sizeOf(context).width * 0.81,
              height: 10,
              icon: '',
              onTap: () {
                Get.toNamed(RouteName.missReportPage);
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

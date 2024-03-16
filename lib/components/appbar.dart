import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Ink(
                width: 59,
                height: 40,
                decoration: ShapeDecoration(
                  color: AppColors.primaryColor.withOpacity(0.20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x1E000000),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Center(
                  child: SvgPicture.asset(AssetImages.backIcon),
                ),
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            Expanded(
              child: Text(
                title.tr,
                textAlign: TextAlign.center,
                style: Styles.appBarH1(),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SvgPicture.asset(AssetImages.horizontalDivider),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LangaugeWidget extends StatelessWidget {
  const LangaugeWidget(
      {super.key,
      required this.img,
      required this.title,
      required this.selected});
  final String img;
  final String title;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(img),
              const SizedBox(
                width: 80,
              ),
              Text(
                title.tr,
                style: Styles.appBarH1(),
              ),
            ],
          ),
          if (selected) SvgPicture.asset(AssetImages.selectIcon)
        ],
      ),
    );
  }
}

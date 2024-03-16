import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';

class PdfFileItem extends StatelessWidget {
  const PdfFileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: AppColors.white.withOpacity(0.6000000238418579),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0x1E0C274F)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        children: [
          SvgPicture.asset(AssetImages.pdf),
          const SizedBox(
            height: 10,
          ),
          Text('Tip 1', style: Styles.choosePageText()),
          SizedBox(
            width: 80,
            child: Text(
              AppStrings.learnTennis.tr,
              style: Styles.lightgrey8(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

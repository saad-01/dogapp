import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.23, -0.97),
                end: Alignment(0.23, 0.97),
                colors: [AppColors.primaryColor, AppColors.gradientColor
                ],
              ),
            ),
            child: Column(
              children: [
                SvgPicture.asset(AssetImages.dogImage),
                const SizedBox(height: 15,),
                const Text(AppStrings.myDog),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
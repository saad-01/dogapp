import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SliderButton extends StatelessWidget {
  const SliderButton({super.key, required this.backFlag, this.onPress});
  final bool backFlag;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(35),
        onTap: onPress,
        child: Ink(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          decoration: ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                strokeAlign: BorderSide.strokeAlignOutside,
                color: AppColors.black.withOpacity(0.25),
              ),
              borderRadius: BorderRadius.circular(35),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x1E000000),
                blurRadius: 8,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: backFlag
              ? SvgPicture.asset(AssetImages.btnBack)
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.next,
                      style: Styles.expertSignupPaget1(),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(AssetImages.btnNext),
                  ],
                ),
        ),
      ),
    );
  }
}

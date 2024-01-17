import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {super.key, required this.title, required this.width});
  final String title;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Ink(
          width: width,
          height: 52,
          decoration: ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: AppColors.maroonColor),
              borderRadius: BorderRadius.circular(8),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 12,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: Styles.maroon20(),
            ),
          ),
        ),
      ),
    );
  }
}

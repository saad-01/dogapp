import 'package:dogapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrimaryBox extends StatelessWidget {
  const PrimaryBox({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      height: 86,
      width: 86,
      decoration: ShapeDecoration(
        color: const Color(0x141FAB89),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1.50, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: SvgPicture.asset(
        imagePath,
      ),
    );
  }
}

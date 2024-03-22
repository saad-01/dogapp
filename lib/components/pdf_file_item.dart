import 'package:dogapp/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';

class PdfFileItem extends StatelessWidget {
  const PdfFileItem({super.key, this.onTap});
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
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
          ],
        ),
      ),
    );
  }
}

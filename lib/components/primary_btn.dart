import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrimartyButton extends StatelessWidget {
  const PrimartyButton(
      {super.key,
      required this.title,
      this.onTap,
      required this.width,
      required this.height,
      required this.icon});
  final String title;
  final void Function()? onTap;
  final double width;
  final double height;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        width: width * 3.4,
        padding: EdgeInsets.symmetric(horizontal: width, vertical: height),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment(-1.00, -0.03),
            end: Alignment(1, 0.03),
            colors: [AppColors.primaryColor, AppColors.gradientColor],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          shadows: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 12,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == '' ? const SizedBox() : SvgPicture.asset(icon),
            if (icon != '')
              const SizedBox(
                width: 10,
              ),
            Text(
              title,
              style: Styles.btnStyle1(),
            ),
          ],
        ),
      ),
    );
  }
}

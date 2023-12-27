import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AlternatingButton extends StatelessWidget {
  const AlternatingButton(
      {super.key,
      required this.title,
      required this.outlined,
      required this.width,
      required this.height,
      required this.withIcon,
      this.icon, this.style});
  final String title;
  final bool outlined;
  final double width;
  final double height;
  final bool withIcon;
  final String? icon;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {
          Get.toNamed(RouteName.releasedReportPage);
        },
        child: Ink(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: outlined ? AppColors.white : AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: withIcon
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(icon!),
                    const SizedBox(
                      width: 25,
                    ),
                    Text(
                      title,
                      style: style,
                    )
                  ],
                )
              : Center(
                  child: Text(
                    title,
                    style:style,
                  ),
                ),
        ),
      ),
    );
  }
}

import 'package:dogapp/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';

class IntroBtn extends StatelessWidget {
  const IntroBtn(
      {super.key,
      required this.title,
      required this.clr,
      required this.showIcon,
      this.icon,
      this.onPress,
      this.loading});
  final String title;
  final Color clr;
  final bool showIcon;
  final bool? loading;
  final String? icon;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
        height: 52,
        decoration: ShapeDecoration(
          color: clr,
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
        child: loading != null
            ? loading!
                ? const Center(
                    child: SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                    ),
                  ))
                : showIcon
                    ? Row(
                        children: [
                          SvgPicture.asset(icon!),
                          const SizedBox(width: 40),
                          Text(
                            title.tr,
                            style: Styles.black14(),
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          title.tr,
                          style: Styles.appBarH1(),
                        ),
                      )
            : showIcon
                ? Row(
                    children: [
                      SvgPicture.asset(icon!),
                      const SizedBox(width: 40),
                      Text(
                        title.tr,
                        style: Styles.black14(),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      title.tr,
                      style: Styles.appBarH1(),
                    ),
                  ),
      ),
    );
  }
}

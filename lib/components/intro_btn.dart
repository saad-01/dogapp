import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/styles.dart';

class IntroBtn extends StatelessWidget {
  const IntroBtn(
      {super.key,
      required this.title,
      required this.clr,
      required this.showIcon,
      this.icon,
      this.onPress});
  final String title;
  final Color clr;
  final bool showIcon;
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
        child: showIcon
            ? Row(
                children: [
                  SvgPicture.asset(icon!),
                  const SizedBox(width: 40),
                  Text(
                    title,
                    style: Styles.black14(),
                  ),
                ],
              )
            : Center(
                child: Text(
                  title,
                  style: Styles.appBarH1(),
                ),
              ),
      ),
    );
  }
}

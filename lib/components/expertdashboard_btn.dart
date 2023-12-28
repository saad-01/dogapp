import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExpertDashboardBtn extends StatelessWidget {
  const ExpertDashboardBtn(
      {super.key,
      this.onPress,
      this.width,
      this.height,
      required this.title,
      this.leading,
      this.trailing,
      this.clr,
      required this.borderClr,
      this.bgClr});
  final void Function()? onPress;
  final double? width;
  final double? height;
  final String title;
  final String? leading;
  final String? trailing;
  final Color? clr;
  final Color borderClr;
  final Color? bgClr;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
        borderRadius: BorderRadius.circular(6),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: bgClr,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.50, color: borderClr),
              borderRadius: BorderRadius.circular(6),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x1E000000),
                blurRadius: 8,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Center(
            child: leading != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(leading!),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              color: clr,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(trailing!),
                    ],
                  )
                : Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      color: clr,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

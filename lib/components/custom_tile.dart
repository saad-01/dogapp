import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTile extends StatelessWidget {
  const CustomTile(
      {super.key,
      this.clr,
      required this.title,
      required this.leading,
      required this.trailing, this.onPress});
  final Color? clr;
  final String title;
  final String leading;
  final String trailing;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        height: 73,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: ShapeDecoration(
          color: clr,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.50,
              color: Colors.black.withOpacity(0.11999999731779099),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 8,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(leading),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(AssetImages.verticalDividerlg),
              ],
            ),
            Text(
              title,
              style: clr == const Color(0xFFFFF2F9)
                  ? Styles.weight()
                  : clr == AppColors.white
                      ? Styles.expertSignupPaget1()
                      : Styles.white18(),
            ),
            SvgPicture.asset(
              trailing,
            ),
          ],
        ),
      ),
    );
  }
}

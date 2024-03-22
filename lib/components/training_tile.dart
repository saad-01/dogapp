import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets.dart';

class TrainingTile extends StatelessWidget {
  const TrainingTile(
      {super.key,
      this.onTap,
      required this.category,
      required this.title,
      required this.subtitle});
  final void Function()? onTap;
  final String category;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: ShapeDecoration(
          color: category == AppStrings.goodManners
              ? const Color(0xFFFFD4C2)
              : const Color(0xFFCFE0FF),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.50,
              color: Colors.black.withOpacity(0.11999999731779099),
            ),
            borderRadius: BorderRadius.circular(10),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.expertSignupPaget1(),
                  ),
                  Expanded(
                      child: Text(
                    subtitle,
                    style: Styles.grey8(),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )),
                ],
              ),
            ),
            const SizedBox(
              width: 35,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (category == AppStrings.excercise)
                  SvgPicture.asset(AssetImages.swimDog),
                if (category == AppStrings.games)
                  SvgPicture.asset(AssetImages.playDog),
                if (category == AppStrings.goodManners)
                  SvgPicture.asset(AssetImages.tickDog),
              ],
            )
          ],
        ),
      ),
    );
  }
}

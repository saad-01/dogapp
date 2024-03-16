import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, this.onPress, required this.title});
  final void Function()? onPress;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        padding: const EdgeInsets.all(15),
        decoration: ShapeDecoration(
          color: AppColors.white,
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
          children: [
            Column(
              children: [
                Container(
                  width: 86,
                  height: 86,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage(AssetImages.dogItem),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 1.50, color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  AppStrings.nameCapital.tr,
                  style: Styles.expertSignupPaget1(),
                ),
                const SizedBox(
                  height: 4,
                ),
                SizedBox(
                  width: 70,
                  child: Text(
                    "Dain's Training expert",
                    style: Styles.black10Sub(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            SvgPicture.asset(AssetImages.fileDivider),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.tr,
                    style: Styles.primaryText(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'After this exercise yor dog will pay more attention to you and your hands. Get your dog’s attention and show them some super tasty food or treats in your hand.',
                          style: Styles.lightGrey12(),
                          maxLines: 4,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.dateFormat.tr,
                      style: Styles.black10Sub(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

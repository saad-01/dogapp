import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class MissDogItem extends StatelessWidget {
  const MissDogItem({super.key, this.onPress, required this.title});
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
                      Text(
                        AppStrings.color.tr,
                        style: Styles.lightGrey12(),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Gray',
                        style: Styles.lightGrey12(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.breed.tr,
                        style: Styles.lightGrey12(),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        AppStrings.breed.tr,
                        style: Styles.lightGrey12(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.lostDate.tr,
                        style: Styles.lightGrey12(),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          AppStrings.dateFormat.tr,
                          style: Styles.lightGrey12(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.lostAddress.tr,
                        style: Styles.lightGrey12(),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          'Address here',
                          style: Styles.lightGrey12(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

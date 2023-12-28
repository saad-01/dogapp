import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class FileItem extends StatelessWidget {
  const FileItem({super.key, this.onPress});
  final void Function()? onPress;
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
                  width: 73,
                  height: 73,
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
                  AppStrings.nameCapital,
                  style: Styles.expertSignupPaget1(),
                ),
                Text(
                  AppStrings.dateFormat,
                  style: Styles.black10Sub(),
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
                    "Leptospirosis(${AppStrings.vaccination})",
                    style: Styles.subPrimaryText(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.dateFormat,
                        style: Styles.appointSub(),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        AppStrings.time,
                        style: Styles.appointSub(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    AppStrings.healthSub,
                    style: Styles.appointSub(),
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

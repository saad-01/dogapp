import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class DogManageWidget extends StatelessWidget {
  const DogManageWidget({super.key, this.onPress});
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.50,
              color: AppColors.black.withOpacity(0.11999999731779099),
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
            Container(
              width: 94,
              height: 94,
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
              width: 14,
            ),
            SvgPicture.asset(AssetImages.verticalDivider),
            const SizedBox(
              width: 14,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.dogName,
                    style: Styles.expertSignupPaget1(),
                  ),
                  Text(
                    AppStrings.dateFormat,
                    style: Styles.black10Sub(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 4),
                        decoration: ShapeDecoration(
                          color: AppColors.statusBg1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(AssetImages.archieve),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                AppStrings.sendArchive,
                                style: Styles.primary8Txt(),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                            ]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteName.reasonPage);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 4),
                          decoration: ShapeDecoration(
                            color: AppColors.statusBg2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(AssetImages.del),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  AppStrings.deleteDog,
                                  style: Styles.red8(),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                              ]),
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

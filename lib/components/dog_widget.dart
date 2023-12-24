import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class DogWidget extends StatelessWidget {
  const DogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.dogDetailsPage);
      },
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: ShapeDecoration(
          color: Colors.white,
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
                  const Row(
                    children: [
                      DogItemInfo(
                        title: AppStrings.appointments,
                        icon: AssetImages.dogItemCalendar,
                        number: '2',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DogItemInfo(
                        title: AppStrings.msgs,
                        icon: AssetImages.dogItemMsg,
                        number: '0',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    width: 86,
                    child: DogItemInfo(
                      title: AppStrings.reminders,
                      icon: AssetImages.dogItemClock,
                      number: '0',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        AppStrings.seeProfile,
                        style: Styles.primary12UText(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(AssetImages.nextPrimaryIcon)
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

class DogItemInfo extends StatelessWidget {
  const DogItemInfo(
      {super.key,
      required this.title,
      required this.icon,
      required this.number});
  final String title;
  final String icon;
  final String number;
  @override
  Widget build(BuildContext context) {
    int num = int.parse(number);
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2.0, right: 1),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            decoration: ShapeDecoration(
              color: AppColors.statusBg1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(icon),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    title,
                    style: Styles.primary8Txt(),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    number,
                    style: Styles.primary10Txt(),
                  ),
                ]),
          ),
        ),
        if (num > 0)
          Positioned(
              right: 0,
              child: Container(
                width: 6,
                height: 6,
                decoration: const ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: OvalBorder(),
                ),
              ))
      ],
    );
  }
}

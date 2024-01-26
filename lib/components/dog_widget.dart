import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import 'pic_container.dart';

class DogWidget extends StatelessWidget {
  const DogWidget(
      {super.key,
      this.onPress,
      required this.name,
      required this.url,
      required this.date});
  final void Function()? onPress;
  final String name;
  final String url;
  final String date;
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
            PicContainer(
              width: 94,
              height: 94,
              child: Image.network(
                url,
                fit: BoxFit.cover,
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
                    name,
                    style: Styles.expertSignupPaget1(),
                  ),
                  Text(
                    date,
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
                        width: 5,
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
                    style: Styles.primary8Txt(),
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

import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget(
      {super.key,
      required this.type,
      required this.name,
      required this.date,
      required this.time,
      required this.image,
      required this.title,
      required this.approvalFlag,
      this.onPress});
  final String type;
  final String name;
  final String date;
  final String time;
  final String image;
  final String title;
  final bool approvalFlag;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteName.appointDetailsPage);
      },
      child: Ink(
        padding: const EdgeInsets.all(10),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Leptospirosis($type)",
                      style: Styles.subPrimaryText(),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    StatusWidget(title: title, approval: approvalFlag),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  name,
                  style: Styles.appointSub(),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  date,
                  style: Styles.appointSub(),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  time,
                  style: Styles.appointSub(),
                ),
              ],
            ),
            SvgPicture.asset(image),
          ],
        ),
      ),
    );
  }
}

class StatusWidget extends StatelessWidget {
  const StatusWidget(
      {super.key, this.color, required this.title, required this.approval});
  final Color? color;
  final String title;
  final bool approval;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 17,
      decoration: ShapeDecoration(
        color: approval ? AppColors.statusBg1 : AppColors.statusBg2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      ),
      child: Center(
          child: Text(
        title,
        style: approval ? Styles.approvalTxt() : Styles.denialTxt(),
      )),
    );
  }
}

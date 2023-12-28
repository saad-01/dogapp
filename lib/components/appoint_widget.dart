import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../utils/strings.dart';

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
      this.onPress,
      this.showStatus});
  final String type;
  final String name;
  final String date;
  final String time;
  final String image;
  final String title;
  final bool approvalFlag;
  final bool? showStatus;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
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
                      type == 'Excercise'
                          ? "${AppStrings.handFeeding}($type)"
                          : "Leptospirosis($type)",
                      style: Styles.subPrimaryText(),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (showStatus == null) ...[
                      if (title != 'Requested')
                        StatusWidget(title: title, approval: approvalFlag),
                      if (title == 'Requested')
                        RequestedWidget(
                          title: title,
                        ),
                    ]
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

class RequestedWidget extends StatelessWidget {
  const RequestedWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 17,
      decoration: ShapeDecoration(
        color: AppColors.yellowColor.withOpacity(0.20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      ),
      child: Center(
          child: Text(
        title,
        style: Styles.yellow8U(),
      )),
    );
  }
}

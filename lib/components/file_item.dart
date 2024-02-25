import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/styles.dart';

class FileItem extends StatelessWidget {
  const FileItem({super.key, this.onPress, required this.name, required this.date, required this.time, required this.url, required this.note, required this.vaccType, required this.type});
  final void Function()? onPress;
  final String name;
  final String date;
  final String time;
  final String url;
  final String note;
  final String vaccType;
  final String type;
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
                    image: DecorationImage(
                      image: NetworkImage(url),
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
                  name,
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
                    "$vaccType($type)",
                    style: Styles.subPrimaryText(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        date,
                        style: Styles.appointSub(),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        time,
                        style: Styles.appointSub(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    note,
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

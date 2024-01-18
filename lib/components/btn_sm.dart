import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonSmall extends StatelessWidget {
  const ButtonSmall(
      {super.key,
      this.color,
      required this.title,
      required this.icon,
      required this.primaryAlike});
  final Color? color;
  final String title;
  final String icon;
  final bool primaryAlike;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      // width: 164,
      height: 46,
      decoration: ShapeDecoration(
        color: color,
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
            blurRadius: 4,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: primaryAlike ? Styles.primary14() : Styles.grey14(),
          ),
        ],
      ),
    );
  }
}

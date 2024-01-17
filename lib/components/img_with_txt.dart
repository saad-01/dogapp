import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageWithText extends StatelessWidget {
  const ImageWithText(
      {super.key, this.clr, required this.title, required this.image});
  final Color? clr;
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: ShapeDecoration(
        color: clr,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            color: Colors.black.withOpacity(0.11999999731779099),
          ),
          borderRadius: BorderRadius.circular(8),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(image),
          Text(
            title,
            style: Styles.expertSignupPaget1(),
          )
        ],
      ),
    );
  }
}
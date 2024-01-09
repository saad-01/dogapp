import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_colors.dart';

class SelectTextfield extends StatelessWidget {
  const SelectTextfield({
    super.key,
    required this.hintText,
    this.items,
    required this.val,
  });
  final String hintText;
  final String val;
  final List<DropdownMenuItem<String>>? items;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0x3F737373)),
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 6,
            offset: Offset(-2, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              hint: Text(
                hintText,
                style: Styles.expertSignupPaget2(),
              ),
              value: val != '' ? val : null,
              icon: const Text(''),
              underline: const SizedBox(),
              onChanged: (value) {},
              items: items,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SvgPicture.asset(AssetImages.dropDown),
          ),
        ],
      ),
    );
  }
}

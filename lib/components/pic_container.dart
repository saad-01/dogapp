import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class PicContainer extends StatelessWidget {
  const PicContainer(
      {super.key, this.child, this.width, this.height, this.url});
  final Widget? child;
  final double? width;
  final double? height;
  final String? url;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1.50, color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: child);
  }
}

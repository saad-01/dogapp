import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';

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

import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';

class RecievedMsg extends StatelessWidget {
  const RecievedMsg({super.key, required this.msg});
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 23),
              decoration: const ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.50, color: Color(0x1E0C274F)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x0A000000),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Center(
                child: Text(
                  msg,
                  style: Styles.black14(),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            // Text(
            //   '10:28 AM',
            //   style: Styles.black10Sub(),
            // ),
          ],
        ),
      ],
    );
  }
}

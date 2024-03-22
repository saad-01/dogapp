import 'package:flutter/material.dart';

class SenderMsg extends StatelessWidget {
  const SenderMsg({super.key, required this.msg});
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          decoration: const ShapeDecoration(
            color: Color(0x1E1FAB89),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          child: Center(
            child: Text(
              msg,
              style: const TextStyle(
                color: Color(0xFF018383),
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     SvgPicture.asset(AssetImages.seen),
        //     const SizedBox(
        //       width: 5,
        //     ),
        //     Text(
        //       time,
        //       style: Styles.black10Sub(),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}

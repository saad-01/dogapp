import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class DietPlanWidget extends StatelessWidget {
  const DietPlanWidget({super.key, this.onPress, required this.description});
  final void Function()? onPress;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        height: 101,
        decoration: ShapeDecoration(
          color: const Color(0xFFFFF9F2),
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.dietPlan.tr,
                    style: Styles.expertSignupPaget1(),
                  ),
                  Text(
                    description.tr,
                    style: Styles.grey8(),
                    maxLines: 3,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 35,
            ),
            SvgPicture.asset(AssetImages.dogFood)
          ],
        ),
      ),
    );
  }
}

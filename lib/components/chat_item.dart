import 'package:dogapp/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 10,
      tileColor: AppColors.white,
      leading: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Image.asset(AssetImages.dp),
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 0.50, color: Color(0x1E0C274F)),
        borderRadius: BorderRadius.circular(6),
      ),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "10:30 AM",
                style: Styles.black10Sub(),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Dain's Trainer",
                style: Styles.black14(),
              ),
            ],
          ),
        ],
      ),
      onTap: () {
        Get.toNamed(RouteName.chatPage);
      },
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.online,
            style: Styles.darkBlue12(),
          ),
          Text(
            "1 ${AppStrings.message}",
            style: Styles.darkBlue12(),
          ),
        ],
      ),
    );
  }
}

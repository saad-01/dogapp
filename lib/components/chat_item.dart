import 'package:dogapp/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';

class ChatItem extends StatelessWidget {
  const ChatItem(
      {super.key, this.arguments, required this.name, required this.image});
  final dynamic arguments;
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          minVerticalPadding: 10,
          tileColor: AppColors.white,
          leading: SizedBox(
              height: 45,
              width: 45,
              child: ClipOval(
                  child: Image.network(
                image,
                fit: BoxFit.cover,
              ))),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.50, color: Color(0x1E0C274F)),
            borderRadius: BorderRadius.circular(6),
          ),
          title: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text(
              //       "10:30 AM",
              //       style: Styles.black10Sub(),
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  Text(
                    name,
                    style: Styles.black14(),
                  ),
                ],
              ),
            ],
          ),
          onTap: () {
            Get.toNamed(RouteName.chatPage, arguments: arguments);
          },
          // subtitle: Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       AppStrings.online.tr,
          //       style: Styles.darkBlue12(),
          //     ),
          //     Text(
          //       "1 ${AppStrings.message.tr}",
          //       style: Styles.darkBlue12(),
          //     ),
          //   ],
          // ),
        ),
        const SizedBox(
          height: 4,
        ),
      ],
    );
  }
}

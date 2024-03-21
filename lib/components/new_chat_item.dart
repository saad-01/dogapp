import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';

class NewChatItem extends StatelessWidget {
  const NewChatItem({super.key, required this.image, required this.name, required this.details});
  final String image;
  final String name;
  final QueryDocumentSnapshot<Object?> details;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 10,
      tileColor: AppColors.white,
      leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius:
                  BorderRadius.circular(1000) // Set your desired color
              ),
          child: ClipOval(
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          )),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 0.50, color: Color(0x1E0C274F)),
        borderRadius: BorderRadius.circular(6),
      ),
      title: Row(
        children: [
          Text(
            name,
            style: Styles.black14(),
          ),
        ],
      ),
      onTap: () {
        Get.toNamed(RouteName.chatPage,arguments: details);
      },
    );
  }
}

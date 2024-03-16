import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/image_box.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/view_models/services/delete_dog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/appbar.dart';
import '../routes/route_names.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';

class ReasonPage extends StatelessWidget {
  const ReasonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final QueryDocumentSnapshot<Object> arguments = Get.arguments;
    final doc = arguments;
    String dogId = doc['dogId'];
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.deleteDog.tr),
            Expanded(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.selectReason.tr.toUpperCase(),
                      style: Styles.black28(),
                    ),
                    Text(
                      AppStrings.whyReason.tr.toUpperCase(),
                      style: Styles.lightGrey12(),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageBox(
                          imagePath: AssetImages.died,
                          onPress: () {
                            Get.toNamed(RouteName.dogDiedPage, arguments: doc);
                          },
                          title: AppStrings.dogDied.tr,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        ImageBox(
                          imagePath: AssetImages.otherReason,
                          onPress: () {
                            DeleteDog().deleteDog(dogId);
                          },
                          title: AppStrings.otherReason.tr,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

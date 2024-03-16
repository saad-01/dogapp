import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/diet_plan_widget.dart';
import 'package:dogapp/components/food_reminder.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';

class FeedManagePage extends StatelessWidget {
  const FeedManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final QueryDocumentSnapshot<Object> arguments = Get.arguments;
    final doc = arguments;
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.feedManage.tr),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: ShapeDecoration(
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.50,
                                color: AppColors.black
                                    .withOpacity(0.11999999731779099),
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
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 90,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppStrings.foodManagement.tr,
                                  style: Styles.primary20G(),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                AppStrings.feedNote.tr,
                                style: Styles.lightGrey12(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              PrimartyButton(
                                  title: AppStrings.addFood.tr,
                                  width: 210,
                                  height: 12,
                                  onTap: () {
                                    Get.toNamed(RouteName.addFoodPage,
                                        arguments: doc);
                                  },
                                  icon: '')
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: SvgPicture.asset(
                            AssetImages.dogFood,
                            width: 126,
                            height: 94,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.dailFoodReminders.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('dogFood')
                        .where('dogId', isEqualTo: doc['dogId'])
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While data is being fetched, show a loading indicator
                        return const CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        );
                      } else if (snapshot.hasError) {
                        // If an error occurs during data retrieval, display an error message
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // If data retrieval is successful, build the UI with the fetched data
                        final List<QueryDocumentSnapshot> docs =
                            snapshot.data!.docs;
                        // Check if the list of documents is empty
                        if (docs.isEmpty) {
                          // Return an empty widget if there are no documents
                          return Text(
                            AppStrings.none.tr,
                            style: Styles.grey16(),
                          );
                        }

                        // If there are documents, build the UI with the fetched data
                        return Column(
                          children: docs.map((doc) {
                            return Column(
                              children: [
                                FoodReminderItem(
                                    heading: doc['title'],
                                    foodName: doc['foodName'],
                                    onPress: () {
                                      Get.toNamed(RouteName.editFoodPage,
                                          arguments: doc);
                                    },
                                    timeHeading: AppStrings.timeHeading.tr,
                                    time: doc['time']),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.planDogExperts.tr,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('dietPlans')
                        .where('dogId', isEqualTo: doc['dogId'])
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While data is being fetched, show a loading indicator
                        return const CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        );
                      } else if (snapshot.hasError) {
                        // If an error occurs during data retrieval, display an error message
                        return Text('Error: ${snapshot.error}');
                      } else {
                        // If data retrieval is successful, build the UI with the fetched data
                        final List<QueryDocumentSnapshot> docs =
                            snapshot.data!.docs;
                        // Check if the list of documents is empty
                        if (docs.isEmpty) {
                          // Return an empty widget if there are no documents
                          return Text(
                            AppStrings.none.tr,
                            style: Styles.grey16(),
                          );
                        }

                        // If there are documents, build the UI with the fetched data
                        return Column(
                          children: docs.map((docu) {
                            return Column(
                              children: [
                                DietPlanWidget(
                                  description: docu['description'],
                                  onPress: () {
                                    Get.toNamed(RouteName.dietPlanPage,
                                        arguments: docu);
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}

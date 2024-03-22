import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/cmnt_item.dart';
import 'package:dogapp/components/miss_dog_item.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomAppBar(title: AppStrings.notifications.tr),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: ShapeDecoration(
                  color: const Color(0xfffafbfb),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      color: Colors.black.withOpacity(0.11999999731779099),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x1E000000),
                      blurRadius: 8,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: TabBar(
                  unselectedLabelColor: AppColors.black,
                  labelColor: AppColors.white,
                  unselectedLabelStyle: Styles.expertSignupPaget1(),
                  labelStyle: Styles.white16UTxt(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  indicatorColor: AppColors.primaryColor,
                  splashBorderRadius: BorderRadius.circular(10),
                  tabs: <Widget>[
                    Tab(
                      text: AppStrings.notifications.tr,
                    ),
                    Tab(
                      text: AppStrings.comments.tr,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('missingDogs')
                                .where("remove", isEqualTo: false)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
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
                                if (docs.isEmpty) {
                                  // Return an empty widget if there are no documents
                                  return Text(
                                    '',
                                    style: Styles.grey16(),
                                  );
                                }
                                return ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: docs.map((doc) {
                                    List<dynamic> clrs =
                                        jsonDecode(doc['colors']);
                                    List<String> colorsList =
                                        List<String>.from(clrs);
                                    RxList<Color> selectedColors =
                                        <Color>[].obs;
                                    selectedColors.value =
                                        colorsList.map((hex) {
                                      int value = int.parse(hex, radix: 16);
                                      return Color(value);
                                    }).toList();
                                    return Dismissible(
                                      key: Key(
                                          doc.id), // Unique key for each item
                                      onDismissed: (direction) {
                                        // Remove the dog from Firestore
                                        FirebaseFirestore.instance
                                            .collection('missingDogs')
                                            .doc(doc.id)
                                            .update({'remove': true});
                                      },
                                      background: Container(
                                        color: Colors.red,
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        alignment: Alignment.centerRight,
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            MissDogItem(
                                                name: doc['name'],
                                                address: doc['address'],
                                                image: doc['photoUrl'],
                                                date: doc['lostDate'],
                                                selectedColors: selectedColors,
                                                onPress: () {
                                                  Get.toNamed(
                                                      RouteName
                                                          .missDogProfilePage,
                                                      arguments: doc);
                                                },
                                                title:
                                                    AppStrings.missingDog.tr),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              }
                            },
                          ),
                          StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('foundedDogs')
                                .where("remove", isEqualTo: false)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
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
                                if (docs.isEmpty) {
                                  // Return an empty widget if there are no documents
                                  return Text(
                                    '',
                                    style: Styles.grey16(),
                                  );
                                }
                                return ListView(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: docs.map((doc) {
                                    List<dynamic> clrs =
                                        jsonDecode(doc['colors']);
                                    List<String> colorsList =
                                        List<String>.from(clrs);
                                    RxList<Color> selectedColors =
                                        <Color>[].obs;
                                    selectedColors.value =
                                        colorsList.map((hex) {
                                      int value = int.parse(hex, radix: 16);
                                      return Color(value);
                                    }).toList();
                                    return Dismissible(
                                      key: Key(
                                          doc.id), // Unique key for each item
                                      onDismissed: (direction) {
                                        // Remove the dog from Firestore
                                        FirebaseFirestore.instance
                                            .collection('foundedDogs')
                                            .doc(doc.id)
                                            .update({'remove': true});
                                      },
                                      background: Container(
                                        color: Colors.red,
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        alignment: Alignment.centerRight,
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            MissDogItem(
                                              name: 'Unkown',
                                              address: doc['address'],
                                              image: doc['photoUrl'],
                                              date: doc['foundDate'],
                                              selectedColors: selectedColors,
                                              onPress: () {
                                                Get.toNamed(
                                                  RouteName.foundDogProfilePage,
                                                  arguments: doc,
                                                );
                                              },
                                              title: AppStrings.foundedDog.tr,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Center(
                        child: CommentItem(title: AppStrings.commentTitle.tr),
                      ),
                    ),
                  ])),
            ],
          ),
        )),
      ),
    );
  }
}

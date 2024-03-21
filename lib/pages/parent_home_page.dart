import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appoint_widget.dart';
import 'package:dogapp/components/dog_widget.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/view_models/services/notification_services.dart';
import 'package:dogapp/view_models/services/shared_prefence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../routes/route_names.dart';

class ParentHomePage extends StatefulWidget {
  const ParentHomePage({super.key});

  @override
  State<ParentHomePage> createState() => _ParentHomePageState();
}

class _ParentHomePageState extends State<ParentHomePage> {
  SharedPref pref = SharedPref();
  RxString name = ''.obs;
  Future<void> getName() async {
    name.value = (await pref.getNameFromSharedPreferences())!;
  }
  NotificationServices notificationServices = NotificationServices();
  Future<void> sendNoti() async {
    // tokens.add(
    //     "f83mqeSkR0SlvGP-bCytW2:APA91bGVQB-X1LuXvgaP0x10cb0vZBk29ZPGLJcHpIEmQabUFDFfYxk6H2Vhyfq1Xf3KDtFvpELnj27UI-lrmMGNUsBSIPQhIft4nsuT-hME17_hKmdc9Wrf8e6tYQl-lhk1qUFDncMT");
    notificationServices.requestNotificationPermission();
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value) async {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Query the Firestore collection to check if the token exists
      QuerySnapshot tokenSnapshot = await firestore
          .collection("tokens")
          .where('token', isEqualTo: value)
          .get();

      // If the token doesn't exist in the database, insert it
      if (tokenSnapshot.docs.isEmpty) {
        String id = const Uuid().v1();

        await firestore.collection("tokens").doc(id).set({
          'token': value,
          'id': id,
          'uid': FirebaseAuth.instance.currentUser!.uid,
        });

        if (kDebugMode) {
          print('Device Token');
          print(value);
        }
      } else {
        // Token already exists, handle as needed
        if (kDebugMode) {
          print('Token already exists');
        }
      }
    });

    // await FirebaseAPIServices().sendPushNotifications(
    //     title: "add values", body: "add values", token: tokens);
  }
  @override
  void initState() {
    sendNoti();
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Text(
                        "${AppStrings.hey.tr}${name.value}",
                        style: Styles.homeH1(),
                      ),
                    ),
                    Text(
                      "${AppStrings.welcome.tr}MY DOG!",
                      style: Styles.expertSignupPaget1(),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteName.notificationsPage);
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, right: 5),
                        child: SvgPicture.asset(AssetImages.bellIcon),
                      ),
                      Positioned(
                          right: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: const ShapeDecoration(
                              color: AppColors.primaryColor,
                              shape: OvalBorder(),
                            ),
                            child: const Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 8, color: AppColors.white),
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SvgPicture.asset(AssetImages.horizontalDivider),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('dogs')
                  .where('uid',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                  final List<QueryDocumentSnapshot> docs = snapshot.data!.docs;
                  if (docs.isEmpty) {
                    // Return an empty widget if there are no documents
                    return Text(
                      AppStrings.none.tr,
                      style: Styles.grey16(),
                    );
                  }
                  return Column(
                    children: docs.map((doc) {
                      return Column(
                        children: [
                          DogWidget(
                            name: doc['name'],
                            date: doc['date'],
                            url: doc['photoUrl'],
                            onPress: () {
                              Get.toNamed(RouteName.dogDetailsPage,
                                  arguments: doc);
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
            const SizedBox(
              height: 20,
            ),
            PrimartyButton(
              title: AppStrings.addDog.tr,
              width: 180,
              height: 12,
              icon: AssetImages.addWhiteIcon,
              onTap: () {
                Get.toNamed(RouteName.addDogPage);
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.upcommingAppointments.tr,
                  style: Styles.expertSignupPaget1(),
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.seeAll.tr,
                      style: Styles.subYellowText(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(AssetImages.nextYellowIcon)
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('appointments')
                  .where('parentId',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .where('releaseFlag', isEqualTo: false)
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

                  final List<QueryDocumentSnapshot> docs = snapshot.data!.docs;

                  if (docs.isEmpty) {
                    // Return an empty widget if there are no documents
                    return Text(
                      AppStrings.none.tr,
                      style: Styles.grey16(),
                    );
                  }
                  return Column(
                    children: docs.map((doc) {
                      String vaccType = doc['vaccinationType'];
                      String type = doc['type'];
                      String image = '';
                      if (vaccType.isEmpty) {
                        vaccType = doc['reason'];
                      }
                      if (type == 'vaccination') {
                        image = AssetImages.injectionImage;
                      } else if (type == 'medicine') {
                        image = AssetImages.medImage;
                      } else if (type == 'other') {
                        image = AssetImages.boneMeal;
                      } else if (type == 'symptoms') {
                        image = AssetImages.symptoms;
                      } else if (type == 'vet') {
                        image = AssetImages.vetImage;
                      } else {
                        image = AssetImages.antiParasite;
                      }
                      return Column(
                        children: [
                          AppointmentWidget(
                              type: "$vaccType(${doc['type']})",
                              name: AppStrings.dogName.tr,
                              id: doc['dogId'],
                              date: doc['date'],
                              time: doc['time'],
                              image: image,
                              title: doc['status'],
                              onPress: () {
                                Get.toNamed(RouteName.appointDetailsPage,
                                    arguments: doc);
                              },
                              approvalFlag: doc['status'] == 'Approved' ||
                                      doc['status'] == 'Completed'
                                  ? true
                                  : false),
                          const SizedBox(
                            height: 11,
                          ),
                        ],
                      );
                    }).toList(),
                  );
                }
              },
            ),
            // AppointmentWidget(
            //     type: AppStrings.medicine.tr,
            //     name: AppStrings.dogName.tr,
            //     date: AppStrings.dateFormat.tr,
            //     time: AppStrings.time.tr,
            //     image: AssetImages.medImage,
            //     title: AppStrings.denied.tr,
            //     onPress: () {
            //       Get.toNamed(RouteName.appointDetailsPage);
            //     },
            //     approvalFlag: false),
          ]),
        ),
      )),
    );
  }
}

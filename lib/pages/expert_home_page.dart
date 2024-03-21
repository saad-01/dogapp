import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../components/appoint_widget.dart';
import '../components/dog_widget.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';
import '../view_models/services/notification_services.dart';
import '../view_models/services/shared_prefence.dart';

class ExpertHomePage extends StatefulWidget {
  const ExpertHomePage({super.key});

  @override
  State<ExpertHomePage> createState() => _ExpertHomePageState();
}

class _ExpertHomePageState extends State<ExpertHomePage> {
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.underCare.tr,
                style: Styles.expertSignupPaget1(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('appointments')
                  .where('expertId',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .where('status', isEqualTo: 'Approved')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  );
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                List<String> dogIds = []; // Store unique dog IDs
                List<QueryDocumentSnapshot> appointments = snapshot.data!.docs;
                // Collect unique dog IDs from appointments
                appointments.forEach((appointment) {
                  String dogId = appointment['dogId'];
                  if (!dogIds.contains(dogId)) {
                    dogIds.add(dogId);
                  }
                });
                if (dogIds.isEmpty) {
                  return Text(
                    AppStrings.none.tr,
                    style: Styles.grey16(),
                  );
                }
                return Column(
                  children: dogIds.map((dogId) {
                    return StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('dogs')
                          .doc(dogId)
                          .snapshots(),
                      builder: (context, dogSnapshot) {
                        if (dogSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          );
                        }
                        if (dogSnapshot.hasError) {
                          return Text('Error: ${dogSnapshot.error}');
                        }
                        if (!dogSnapshot.hasData || !dogSnapshot.data!.exists) {
                          return Text(
                            AppStrings.none.tr,
                            style: Styles.grey16(),
                          );
                        }
                        final doc = dogSnapshot.data!;
                        return Column(
                          children: [
                            DogWidget(
                              name: doc['name'],
                              date: doc['date'],
                              url: doc['photoUrl'],
                              onPress: () {
                                Get.toNamed(RouteName.expertdogDetailsPage,
                                    arguments: doc);
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                    );
                  }).toList(),
                );
              },
            ),
            // DogWidget(
            //   name: '',
            //   date: '',
            //   url: '',
            //   onPress: () {
            //     Get.toNamed(RouteName.expertdogDetailsPage);
            //   },
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // DogWidget(
            //   name: '',
            //   date: '',
            //   url: '',
            //   onPress: () {
            //     Get.toNamed(RouteName.expertdogDetailsPage);
            //   },
            // ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.requests.tr,
                  style: Styles.expertSignupPaget1(),
                ),
                // Row(
                //   children: [
                //     Text(
                //       AppStrings.seeAll.tr,
                //       style: Styles.subYellowText(),
                //     ),
                //     const SizedBox(
                //       width: 10,
                //     ),
                //     // SvgPicture.asset(AssetImages.nextYellowIcon)
                //   ],
                // ),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('appointments')
                  .where('expertId',
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
                                Get.toNamed(RouteName.appointExpertPage,
                                    arguments: {
                                      "document": doc,
                                      "status": doc["status"]
                                    });
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
          ]),
        ),
      )),
    );
  }
}

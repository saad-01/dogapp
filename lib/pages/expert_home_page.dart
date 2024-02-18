import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/appoint_widget.dart';
import '../components/dog_widget.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';
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

  @override
  void initState() {
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
                        "${AppStrings.hey}${name.value}",
                        style: Styles.homeH1(),
                      ),
                    ),
                    Text(
                      "${AppStrings.welcome}MY DOG!",
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
                AppStrings.underCare,
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
                  // While data is being fetched, show a loading indicator
                  return const CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  );
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                  // If an error occurs during data retrieval, display an error message
                }
                List<QueryDocumentSnapshot> appointments = snapshot.data!.docs;
                if (appointments.isEmpty) {
                  // Return an empty widget if there are no documents
                  return Text(
                    AppStrings.none,
                    style: Styles.grey16(),
                  );
                }
                return Column(
                  children: appointments.map((appointment) {
                    String dogId = appointment['dogId'];
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
                            AppStrings.none,
                            style: Styles.grey16(),
                          );
                        }
                        // You can build your custom widget here to display dog details
                        final doc = dogSnapshot.data!;
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
                  AppStrings.requests,
                  style: Styles.expertSignupPaget1(),
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.seeAll,
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
                  .where('expertId',
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
                      AppStrings.none,
                      style: Styles.grey16(),
                    );
                  }
                  return Column(
                    children: docs.map((doc) {
                      return Column(
                        children: [
                          AppointmentWidget(
                              type: "${doc['vaccinationType']}(${doc['type']})",
                              name: AppStrings.dogName,
                              id: doc['dogId'],
                              date: doc['date'],
                              time: doc['time'],
                              image: doc['type'] == 'vaccination'
                                  ? AssetImages.injectionImage
                                  : AssetImages.medImage,
                              title: doc['status'],
                              onPress: () {
                                Get.toNamed(RouteName.appointDetailsPage,
                                    arguments: doc);
                              },
                              approvalFlag:
                                  doc['status'] == 'Approved' ? true : false),
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

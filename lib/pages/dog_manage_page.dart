import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/dog_manage_item.dart';
import '../routes/route_names.dart';
import '../utils/styles.dart';

class DogManagementPage extends StatelessWidget {
  const DogManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.management),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
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
                        final List<QueryDocumentSnapshot> docs =
                            snapshot.data!.docs;
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
                                DogManageWidget(
                                  name: doc['name'],
                                  date: doc['date'],
                                  url: doc['photoUrl'],
                                  onPress: () {
                                    Get.toNamed(RouteName.reasonPage, arguments: doc);
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

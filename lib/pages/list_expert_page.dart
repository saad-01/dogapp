import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/expert_item.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../view_models/select_expert_model.dart';

class ListExpertPage extends StatelessWidget {
  const ListExpertPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String type = Get.arguments;
    final expertVM = Get.put(SelectExpertModel());
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.selectExpertSingle),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .where('role', isEqualTo: 'expert')
                          .where('speciality', isEqualTo: type)
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
                              AppStrings.none,
                              style: Styles.grey16(),
                            );
                          }
                          return Column(
                            children: docs.map((doc) {
                              return Column(
                                children: [
                                  ExpertItem(
                                    name: doc['name'],
                                    url: doc['photoUrl'],
                                    expertis: AppStrings.trainExpert,
                                    filledBtnTitle: AppStrings.relReport,
                                    onPress: () {
                                      expertVM.setData(doc);
                                      Get.back();
                                    },
                                  ),
                                  const SizedBox(
                                    height: 15,
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
              ),
            )
          ],
        ),
      )),
    );
  }
}

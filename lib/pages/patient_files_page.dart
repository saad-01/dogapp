import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/file_item.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';

class PatientFilesPage extends StatefulWidget {
  const PatientFilesPage({super.key});

  @override
  State<PatientFilesPage> createState() => _PatientFilesPageState();
}

class _PatientFilesPageState extends State<PatientFilesPage> {
  final DocumentSnapshot<Object> dog = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.patientFiles),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('appointments')
                          .where('dogId', isEqualTo: dog['dogId'])
                          .where('releaseFlag', isEqualTo: true)
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
                              String vaccType = doc['vaccinationType'];
                              if (vaccType.isEmpty) {
                                vaccType = doc['reason'];
                              }

                              return Column(
                                children: [
                                  FileItem(
                                    type: doc['type'],
                                    vaccType: vaccType,
                                    name: dog['name'],
                                    date: doc['date'],
                                    time: doc['time'],
                                    url: dog['photoUrl'],
                                    onPress: () {
                                      Get.toNamed(RouteName.fileDetailsPage,
                                          arguments: {
                                            "document": doc,
                                            "dog": dog
                                          });
                                    },
                                    note: doc['notes'],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                ],
                              );
                            }).toList(),
                          );
                        }
                      }),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}

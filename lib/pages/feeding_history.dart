import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../components/history_item.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';

class FeedingHistory extends StatefulWidget {
  const FeedingHistory({super.key});

  @override
  State<FeedingHistory> createState() => _FeedingHistoryState();
}

class _FeedingHistoryState extends State<FeedingHistory> {
  final QueryDocumentSnapshot<Object> doc = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.history.tr),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('dogFood')
                          .where(
                            'dogId',
                            isEqualTo: doc['dogId'],
                          )
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
                          // Check if the list of documents is empty
                          if (docs.isEmpty) {
                            // Return an empty widget if there are no documents
                            return Text(
                              AppStrings.none.tr,
                              style: Styles.grey16(),
                            );
                          }
                          return Column(
                            children: docs.map((doc) {
                              Timestamp timestamp = doc['timeStamp'];
                              // Convert to DateTime
                              DateTime dateTime = timestamp.toDate();
                              // Format the DateTime
                              String formattedDateTime =
                                  DateFormat('dd.MM.yy HH:mm').format(dateTime);
                              return Column(
                                children: [
                                  HistoryItem(
                                      heading: AppStrings.history.tr,
                                      foodName: doc['foodName'],
                                      quantity: doc['quantity'],
                                      note: doc['notes'],
                                      timeHeading: AppStrings.dateTime.tr,
                                      time: formattedDateTime),
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
              ),
            )
          ],
        ),
      )),
    );
  }
}

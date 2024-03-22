import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/training_tile.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/appbar.dart';
import '../utils/assets.dart';

class ExpertExerciseDetails extends StatefulWidget {
  const ExpertExerciseDetails({super.key});

  @override
  State<ExpertExerciseDetails> createState() => _ExpertExerciseDetailsState();
}

class _ExpertExerciseDetailsState extends State<ExpertExerciseDetails> {
  final doc = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(
              title: AppStrings.exercises.tr,
            ),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('trainings')
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
                                TrainingTile(
                                  category: doc['category'],
                                  title: doc['title'],
                                  subtitle: doc['note'],
                                  onTap: () {
                                    Get.toNamed(RouteName.expertExDetailsPage,
                                        arguments: doc);
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.toNamed(RouteName.expertExDetailsPage);
                  //   },
                  //   child: Container(
                  //     height: 100,
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 15, vertical: 10),
                  //     decoration: ShapeDecoration(
                  //       color: const Color(0xFFCFE0FF),
                  //       shape: RoundedRectangleBorder(
                  //         side: BorderSide(
                  //           width: 0.50,
                  //           color:
                  //               Colors.black.withOpacity(0.11999999731779099),
                  //         ),
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       shadows: const [
                  //         BoxShadow(
                  //           color: Color(0x0F000000),
                  //           blurRadius: 8,
                  //           offset: Offset(0, 2),
                  //           spreadRadius: 0,
                  //         )
                  //       ],
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Expanded(
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 AppStrings.handFeeding.tr,
                  //                 style: Styles.expertSignupPaget1(),
                  //               ),
                  //               Expanded(
                  //                   child: Text(
                  //                 AppStrings.handFeedNote.tr,
                  //                 style: Styles.grey8(),
                  //                 maxLines: 4,
                  //                 overflow: TextOverflow.ellipsis,
                  //               )),
                  //             ],
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           width: 35,
                  //         ),
                  //         Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             SvgPicture.asset(AssetImages.excercise),
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   height: 100,
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 15, vertical: 10),
                  //   decoration: ShapeDecoration(
                  //     color: const Color(0xFFFFD4C2),
                  //     shape: RoundedRectangleBorder(
                  //       side: BorderSide(
                  //         width: 0.50,
                  //         color: Colors.black.withOpacity(0.11999999731779099),
                  //       ),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     shadows: const [
                  //       BoxShadow(
                  //         color: Color(0x0F000000),
                  //         blurRadius: 8,
                  //         offset: Offset(0, 2),
                  //         spreadRadius: 0,
                  //       )
                  //     ],
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text(
                  //               AppStrings.walk.tr,
                  //               style: Styles.expertSignupPaget1(),
                  //             ),
                  //             Expanded(
                  //                 child: Text(
                  //               AppStrings.handFeedNote.tr,
                  //               style: Styles.grey8(),
                  //               maxLines: 4,
                  //               overflow: TextOverflow.ellipsis,
                  //             )),
                  //           ],
                  //         ),
                  //       ),
                  //       const SizedBox(
                  //         width: 35,
                  //       ),
                  //       Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           SvgPicture.asset(AssetImages.walk),
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 24,
                  // ),
                  const Spacer(),
                  PrimartyButton(
                      title: AppStrings.addExercise.tr,
                      width: 250,
                      height: 15,
                      onTap: () {
                        Get.toNamed(RouteName.addTrainingPage, arguments: doc);
                      },
                      icon: AssetImages.addWhiteIcon),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

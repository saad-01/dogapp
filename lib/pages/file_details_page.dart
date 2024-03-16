import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/pic_container.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';

class FileDetailsPage extends StatefulWidget {
  const FileDetailsPage({super.key});

  @override
  State<FileDetailsPage> createState() => _FileDetailsPageState();
}

class _FileDetailsPageState extends State<FileDetailsPage> {
  final Map arguments = Get.arguments;
  dynamic doc;
  String vaccType = '';
  String type = '';
  String image = '';
  dynamic dog;
  @override
  void initState() {
    doc = arguments['document'];
    dog = arguments['dog'];
    vaccType = doc['vaccinationType'];
    type = doc['type'];
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
    super.initState();
  }

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
              CustomAppBar(title: "${dog['name']}'s File"),
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
                  tabs:<Widget>[
                    Tab(
                      text: AppStrings.detail.tr,
                    ),
                    Tab(
                      text: AppStrings.profile.tr,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 58.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: ShapeDecoration(
                                      color: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.50,
                                          color: Colors.black
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
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              doc['status'],
                                              style: Styles.primary16U(),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 110.0),
                                          child: Divider(
                                            color: Color(0xFFA8A8A8),
                                          ),
                                        ),
                                        Text(
                                          vaccType.tr,
                                          style: Styles.expertSignupPaget1(),
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                '${AppStrings.appointType.tr}:',
                                                style: Styles.grey14()),
                                            Text(
                                              type.tr,
                                              style: Styles.black14(),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${AppStrings.pet.tr}:',
                                                style: Styles.grey14()),
                                            Text(
                                              dog['name'],
                                              style: Styles.black14(),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${AppStrings.date.tr}:',
                                                style: Styles.grey14()),
                                            Text(
                                              doc['date'],
                                              style: Styles.black14(),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        Row(
                                          children: [
                                            Text('${AppStrings.notes.tr}:',
                                                style: Styles.grey14()),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                doc['notes'],
                                                style: Styles.choosePageText(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    left: 0,
                                    child: SvgPicture.asset(
                                      image,
                                      width: 100,
                                    ))
                              ],
                            ),
                            if (doc['parentId'] ==
                                FirebaseAuth.instance.currentUser!.uid) ...[
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text('${AppStrings.comments.tr}:',
                                      style: Styles.grey14()),
                                ],
                              ),
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('comments')
                                    .where('appointId', isEqualTo: doc['id'])
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
                                        AppStrings.none.tr,
                                        style: Styles.grey16(),
                                      );
                                    }
                                    return Column(
                                      children: docs.map((docu) {
                                        return Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(docu['comment'],
                                                      style: Styles
                                                          .choosePageText()),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    );
                                  }
                                },
                              ),
                            ],
                            const SizedBox(
                              height: 30,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     ExpertDashboardBtn(
                            //       title: AppStrings.completed.tr,
                            //       borderClr: AppColors.primaryColor,
                            //       height: 53,
                            //       width:
                            //           MediaQuery.sizeOf(context).width * 0.88,
                            //       leading: AssetImages.thumbsUpFilled,
                            //       trailing: AssetImages.nextPrimaryIcon,
                            //       bgClr: const Color(0xFFecf9f6),
                            //       clr: AppColors.primaryColor,
                            //     ),
                            //   ],
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     Get.toNamed(RouteName.vaccinationReportPage);
                            //   },
                            //   child: Ink(
                            //     padding: const EdgeInsets.all(20),
                            //     decoration: ShapeDecoration(
                            //       color: AppColors.white,
                            //       shape: RoundedRectangleBorder(
                            //         side: BorderSide(
                            //           width: 0.50,
                            //           color: Colors.black
                            //               .withOpacity(0.11999999731779099),
                            //         ),
                            //         borderRadius: BorderRadius.circular(6),
                            //       ),
                            //       shadows: const [
                            //         BoxShadow(
                            //           color: Color(0x1E000000),
                            //           blurRadius: 8,
                            //           offset: Offset(0, 0),
                            //           spreadRadius: 0,
                            //         )
                            //       ],
                            //     ),
                            //     child: Row(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         Expanded(
                            //           child: Column(
                            //             crossAxisAlignment:
                            //                 CrossAxisAlignment.start,
                            //             children: [
                            //               Text(
                            //                 AppStrings.createFile.tr,
                            //                 style: Styles.expertSignupPaget1(),
                            //               ),
                            //               Text(
                            //                 AppStrings.informParent.tr,
                            //                 style: Styles.choosePageText(),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //         const SizedBox(
                            //           width: 20,
                            //         ),
                            //         SvgPicture.asset(AssetImages.createFile),
                            //       ],
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 60),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 15,
                                        right: 15,
                                        bottom: 25),
                                    decoration: ShapeDecoration(
                                      color: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.50,
                                          color: Colors.black
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
                                        Column(
                                          children: [
                                            const SizedBox(
                                              height: 100,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    '${AppStrings.dogName.tr}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  dog['name'],
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('${AppStrings.breed.tr}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  dog['breed'],
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    '${AppStrings.dateOfBirth.tr}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  dog['date'],
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('${AppStrings.gender.tr}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  dog['gender'],
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('${AppStrings.weight.tr}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  dog['weight'],
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    '${AppStrings.microChipNum.tr}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  dog['microchipNumber'],
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: PicContainer(
                                      height: 116,
                                      width: 116,
                                      child: Image.network(
                                        dog['photoUrl'],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              PrimartyButton(
                  title: AppStrings.addComment.tr,
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  height: 10,
                  onTap: () {
                    Get.toNamed(RouteName.addCommentsPage, arguments: doc);
                  },
                  icon: AssetImages.addWhiteIcon)
            ],
          ),
        )),
      ),
    );
  }
}

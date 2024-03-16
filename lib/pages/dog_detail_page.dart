import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/appoint_widget.dart';
import 'package:dogapp/components/btn_sm.dart';
import 'package:dogapp/components/custom_tile.dart';
import 'package:dogapp/components/img_with_txt.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/training_streak.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/pic_container.dart';

class DogDetailsPage extends StatelessWidget {
  const DogDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final QueryDocumentSnapshot<Object> arguments = Get.arguments;
    final doc = arguments;
    final String weight = doc['weight'];
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                CustomAppBar(title: AppStrings.dogsData.tr),
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
                        text: AppStrings.data.tr,
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
                    child: TabBarView(children: <Widget>[
                  SingleChildScrollView(
                      child: Center(
                          child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 15, right: 15, bottom: 25),
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
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    doc['name'],
                                    style: Styles.expertSignupPaget1(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    AppStrings.releaseDogData.tr,
                                    style: Styles.expertSignupPaget1(),
                                  ),
                                  Text(
                                    AppStrings.createRelease.tr,
                                    textAlign: TextAlign.center,
                                    style: Styles.subText(),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ButtonSmall(
                                          title: AppStrings.editRecord.tr,
                                          icon: AssetImages.editIcon,
                                          primaryAlike: false,
                                          onPress: () {
                                            Get.toNamed(RouteName.editDogPage,
                                                arguments: doc);
                                          },
                                          color: AppColors.white),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      ButtonSmall(
                                        title: AppStrings.shareRecord.tr,
                                        icon: AssetImages.shareIcon,
                                        primaryAlike: true,
                                        onPress: () {
                                          Get.toNamed(
                                              RouteName.addAppointmentPage,
                                              arguments: doc);
                                        },
                                        color: AppColors.shareBtnClr,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: PicContainer(
                                width: 94,
                                height: 94,
                                child: Image.network(doc['photoUrl']),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.50,
                              color:
                                  Colors.black.withOpacity(0.11999999731779099),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppStrings.healthData.tr,
                              style: Styles.primary20G(),
                            ),
                            Text(
                              AppStrings.healthSub.tr,
                              style: Styles.lightGrey12(),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(AssetImages.medicineImage),
                                SvgPicture.asset(AssetImages.capsuleImage),
                                SvgPicture.asset(AssetImages.medBottle),
                                SvgPicture.asset(AssetImages.blueMed),
                                const SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset(AssetImages.yellowMed),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: PrimartyButton(
                                title: AppStrings.appAppoint.tr,
                                width: 242,
                                height: 12,
                                icon: '',
                                onTap: () {
                                  Get.toNamed(RouteName.addAppointmentPage,
                                      arguments: doc);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.parentExPage,
                                    arguments: doc);
                              },
                              child: ImageWithText(
                                title: AppStrings.exerciseExpert.tr,
                                image: AssetImages.excerciseExpert,
                                clr: AppColors.exercieBox,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.feedManagePage,
                                    arguments: doc);
                              },
                              child: ImageWithText(
                                title: AppStrings.feedManage.tr,
                                image: AssetImages.dogFood,
                                clr: AppColors.foodBox,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.weight.tr,
                          style: Styles.expertSignupPaget1(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTile(
                        title: weight.toUpperCase(),
                        leading: AssetImages.weightMachine,
                        trailing: AssetImages.addIcon,
                        clr: const Color(0xFFFFF2F9),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.reminders.tr,
                          style: Styles.expertSignupPaget1(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('appointments')
                            .where('dogId', isEqualTo: doc['dogId'])
                            .where('releaseFlag', isEqualTo: false)
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
                                          Get.toNamed(
                                              RouteName.appointDetailsPage,
                                              arguments: doc);
                                        },
                                        approvalFlag:
                                            doc['status'] == 'Approved' ||
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
                    ],
                  ))),
                  SingleChildScrollView(
                      child: Center(
                          child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 25, left: 15, right: 15, bottom: 25),
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
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    doc['name'],
                                    style: Styles.expertSignupPaget1(),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    AppStrings.releaseDogData.tr,
                                    style: Styles.expertSignupPaget1(),
                                  ),
                                  Text(
                                    AppStrings.createRelease.tr,
                                    textAlign: TextAlign.center,
                                    style: Styles.subText(),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ButtonSmall(
                                          title: AppStrings.editRecord.tr,
                                          icon: AssetImages.editIcon,
                                          primaryAlike: false,
                                          onPress: () {
                                            Get.toNamed(RouteName.editDogPage,
                                                arguments: doc);
                                          },
                                          color: AppColors.white),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      ButtonSmall(
                                        title: AppStrings.shareRecord.tr,
                                        icon: AssetImages.shareIcon,
                                        primaryAlike: true,
                                        onPress: () {
                                          Get.toNamed(
                                              RouteName.addAppointmentPage,
                                              arguments: doc);
                                        },
                                        color: AppColors.shareBtnClr,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: PicContainer(
                                width: 94,
                                height: 94,
                                child: Image.network(doc['photoUrl']),
                              ),
                            ),
                          )
                        ],
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(AppStrings.filesFromExpert.tr,
                      //             style: Styles.expertSignupPaget1()),
                      //         Text(AppStrings.releaseFiles.tr,
                      //             style: Styles.lightGrey12()),
                      //       ],
                      //     ),
                      //     InkWell(
                      //       onTap: () {
                      //         Get.toNamed(RouteName.selectReportPage,
                      //             arguments: false);
                      //       },
                      //       child: Row(
                      //         children: [
                      //           Text(
                      //             AppStrings.seeAll.tr,
                      //             style: Styles.subYellowText(),
                      //           ),
                      //           const SizedBox(
                      //             width: 10,
                      //           ),
                      //           SvgPicture.asset(AssetImages.nextYellowIcon)
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      // Container(
                      //   padding: const EdgeInsets.all(15),
                      //   decoration: ShapeDecoration(
                      //     color: const Color(0xFFFFFAF2),
                      //     shape: RoundedRectangleBorder(
                      //       side: const BorderSide(
                      //           width: 0.50, color: Color(0x3F737373)),
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //     shadows: const [
                      //       BoxShadow(
                      //         color: Color(0x0F000000),
                      //         blurRadius: 6,
                      //         offset: Offset(-2, 2),
                      //         spreadRadius: 0,
                      //       )
                      //     ],
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Container(
                      //         width: 86,
                      //         height: 86,
                      //         decoration: ShapeDecoration(
                      //           image: const DecorationImage(
                      //             image: AssetImage(AssetImages.dogItem),
                      //             fit: BoxFit.cover,
                      //           ),
                      //           shape: RoundedRectangleBorder(
                      //             side: const BorderSide(
                      //                 width: 1.50, color: Color(0xFF1FAB89)),
                      //             borderRadius: BorderRadius.circular(6),
                      //           ),
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         width: 10,
                      //       ),
                      //       Expanded(
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               AppStrings.nameCapital.tr,
                      //               style: Styles.expertSignupPaget1(),
                      //             ),
                      //             Text(
                      //               "Leptospirosis(${AppStrings.vaccination.tr})",
                      //               style: Styles.subPrimaryText(),
                      //             ),
                      //             const SizedBox(
                      //               height: 8,
                      //             ),
                      //             Text(
                      //               AppStrings.note.tr,
                      //               style: Styles.noteTxt(),
                      //               maxLines: 2,
                      //               overflow: TextOverflow.ellipsis,
                      //             ),
                      //           ],
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // SvgPicture.asset(AssetImages.slider),
                      const SizedBox(
                        height: 20,
                      ),
                      const TrainingStreakWidget(),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: ShapeDecoration(
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 0.50,
                              color:
                                  Colors.black.withOpacity(0.11999999731779099),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${AppStrings.dogName.tr}:',
                                        style: Styles.grey14()),
                                    Text(
                                      doc['name'],
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
                                    Text('${AppStrings.breed.tr}:',
                                        style: Styles.grey14()),
                                    Text(
                                      doc['breed'],
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
                                    Text('${AppStrings.dateOfBirth.tr}:',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${AppStrings.gender.tr}:',
                                        style: Styles.grey14()),
                                    Text(
                                      doc['gender'],
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
                                    Text('${AppStrings.weight.tr}:',
                                        style: Styles.grey14()),
                                    Text(
                                      doc['weight'],
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
                                    Text('${AppStrings.microChipNum.tr}:',
                                        style: Styles.grey14()),
                                    Text(
                                      doc['microchipNumber'],
                                      style: Styles.black14(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            PrimartyButton(
                                title: AppStrings.editProfile.tr,
                                width: 180,
                                height: 12,
                                onTap: () {
                                  Get.toNamed(RouteName.editDogPage,
                                      arguments: doc);
                                },
                                icon: AssetImages.editWhite),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ))),
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

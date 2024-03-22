import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/pic_container.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MissedProfilePage extends StatefulWidget {
  const MissedProfilePage({super.key});

  @override
  State<MissedProfilePage> createState() => _MissedProfilePageState();
}

class _MissedProfilePageState extends State<MissedProfilePage> {
  final doc = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                CustomAppBar(title: AppStrings.missingDogProfile.tr),
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
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              doc['name'],
                              style: Styles.expertSignupPaget1(),
                            ),
                            SizedBox(
                              width: 246,
                              child: Text(
                                doc['notes'] ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.subText(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: ShapeDecoration(
                                color: const Color(0xfffafbfb),
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
                                unselectedLabelStyle:
                                    Styles.expertSignupPaget1(),
                                labelStyle: Styles.white16UTxt(),
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicator: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                indicatorColor: AppColors.primaryColor,
                                splashBorderRadius: BorderRadius.circular(10),
                                tabs: <Widget>[
                                  Tab(
                                    text: AppStrings.dogsData.tr,
                                  ),
                                  Tab(
                                    text: AppStrings.parentsData.tr,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      child: Align(
                        alignment: Alignment.center,
                        child: PicContainer(
                          height: 86,
                          width: 86,
                          child: Image.network(
                            doc['photoUrl'],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TabBarView(children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, right: 15, bottom: 15),
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${AppStrings.microChipNum.tr}:',
                                    style: Styles.grey14()),
                                Text(
                                  doc['microchipNumber'],
                                  style: Styles.black14(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${AppStrings.lostDate.tr}:',
                                    style: Styles.grey14()),
                                Text(
                                  doc['lostDate'],
                                  style: Styles.black14(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 15, left: 15, right: 15, bottom: 15),
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${AppStrings.parentName.tr}:',
                                    style: Styles.grey14()),
                                Text(
                                  doc['yourName'],
                                  style: Styles.black14(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${AppStrings.yourNumber.tr}:',
                                    style: Styles.grey14()),
                                Text(
                                  doc['phoneNum'],
                                  style: Styles.black14(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${AppStrings.address.tr}:',
                                    style: Styles.grey14()),
                                Text(
                                  doc['address'],
                                  style: Styles.black14(),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('${AppStrings.notes.tr}:',
                                    style: Styles.grey14()),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                AppStrings.lostNote.tr,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: Styles.lightGrey12(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimartyButton(
                    title: AppStrings.chatParent.tr,
                    width: MediaQuery.sizeOf(context).width * 0.81,
                    height: 12,
                    onTap: () async {
                      final user = await FirebaseFirestore.instance
                          .collection('users')
                          .where('uid', isEqualTo: doc['uid'])
                          .get();
                      final userData = user.docs.first;
                      Get.toNamed(RouteName.chatPage, arguments: userData);
                    },
                    icon: ''),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

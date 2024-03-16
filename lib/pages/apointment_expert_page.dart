import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/expertDashboard_btn.dart';
import 'package:dogapp/components/pic_container.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/view_models/appoint_expert_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/appbar.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';

class AppointmentExpertPage extends StatefulWidget {
  const AppointmentExpertPage({super.key});

  @override
  State<AppointmentExpertPage> createState() => _AppointmentExpertPageState();
}

class _AppointmentExpertPageState extends State<AppointmentExpertPage> {
  final vm = Get.put(AppointExpertModel());

  String status = '';
  final Map arguments = Get.arguments;
  dynamic doc;
  RxString name = ''.obs;
  RxString date = ''.obs;
  String vaccType = '';
  String type = '';
  String image = '';
  RxString breed = ''.obs;
  RxString microchipNumber = ''.obs;
  RxString gender = ''.obs;
  RxString weight = ''.obs;
  RxString photoUrl =
      'https://img.freepik.com/free-photo/puppy-that-is-walking-snow_1340-37228.jpg'
          .obs;
  getDogName(String id) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection(
            'dogs') // Replace 'your_collection' with your collection name
        .doc(id) // Replace 'your_document_id' with your document ID
        .get();
    dynamic fieldValue = snapshot.get('name');
    dynamic dateVal = snapshot.get('date');
    dynamic breedVal = snapshot.get('breed');
    dynamic microVal = snapshot.get('microchipNumber');
    dynamic genderVal = snapshot.get('gender');
    dynamic weightVal = snapshot.get('weight');
    dynamic photoVal = snapshot.get('photoUrl');
    name.value = fieldValue.toString();
    date.value = dateVal.toString();
    breed.value = breedVal.toString();
    gender.value = genderVal.toString();
    microchipNumber.value = microVal.toString();
    weight.value = weightVal.toString();
    photoUrl.value = photoVal.toString();
  }

  @override
  void initState() {
    status = arguments['status'];
    doc = arguments['document'];
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
    getDogName(doc['dogId']);
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
              CustomAppBar(title: AppStrings.appointDetail.tr),
              const SizedBox(
                height: 20,
              ),
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
                                              status == 'Approved'
                                                  ? AppStrings.approved.tr
                                                  : status == 'Completed'
                                                      ? AppStrings.completed.tr
                                                      : '',
                                              style: Styles.primary16U(),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 18,
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
                                            Obx(
                                              () => Text(
                                                name.value,
                                                style: Styles.black14(),
                                              ),
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
                            const SizedBox(
                              height: 30,
                            ),
                            if (status == 'Requested')
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ExpertDashboardBtn(
                                    title: AppStrings.reject.tr,
                                    borderClr: AppColors.redShade,
                                    height: 53,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    bgClr: const Color(0xfff8eeed),
                                    clr: AppColors.maroonColor,
                                    onPress: () {
                                      vm.updateStatus(doc['id'], 'Rejected');
                                    },
                                  ),
                                  ExpertDashboardBtn(
                                    title: AppStrings.approve.tr,
                                    borderClr: AppColors.primaryColor,
                                    height: 53,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    bgClr: const Color(0xFFecf9f6),
                                    clr: AppColors.primaryColor,
                                    onPress: () {
                                      vm.updateStatus(doc['id'], 'Approved');
                                    },
                                  ),
                                ],
                              ),
                            if (status == 'Approved')
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ExpertDashboardBtn(
                                    title: AppStrings.completed.tr,
                                    borderClr: AppColors.primaryColor,
                                    height: 53,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.88,
                                    leading: AssetImages.thumbsUpIcon,
                                    trailing: AssetImages.nextPrimaryIcon,
                                    bgClr: const Color(0xFFecf9f6),
                                    clr: AppColors.primaryColor,
                                    onPress: () {
                                      vm.updateStatus(doc['id'], 'Completed');
                                    },
                                  ),
                                ],
                              ),
                            if (status == 'Completed') ...[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ExpertDashboardBtn(
                                    title: AppStrings.completed.tr,
                                    borderClr: AppColors.primaryColor,
                                    height: 53,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.88,
                                    leading: AssetImages.thumbsUpFilled,
                                    trailing: AssetImages.nextPrimaryIcon,
                                    bgClr: const Color(0xFFecf9f6),
                                    clr: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  vm.release(doc['id']);
                                },
                                child: Ink(
                                  padding: const EdgeInsets.all(20),
                                  decoration: ShapeDecoration(
                                    color: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.50,
                                        color: Colors.black
                                            .withOpacity(0.11999999731779099),
                                      ),
                                      borderRadius: BorderRadius.circular(6),
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
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppStrings.createFile.tr,
                                              style:
                                                  Styles.expertSignupPaget1(),
                                            ),
                                            Text(
                                              AppStrings.informParent.tr,
                                              style: Styles.choosePageText(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      SvgPicture.asset(AssetImages.createFile),
                                    ],
                                  ),
                                ),
                              )
                            ]
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
                                                Obx(
                                                  () => Text(
                                                    name.value,
                                                    style: Styles.black14(),
                                                  ),
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
                                                Obx(
                                                  () => Text(
                                                    breed.value,
                                                    style: Styles.black14(),
                                                  ),
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
                                                Obx(
                                                  () => Text(
                                                    date.value,
                                                    style: Styles.black14(),
                                                  ),
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
                                                Obx(
                                                  () => Text(
                                                    gender.value,
                                                    style: Styles.black14(),
                                                  ),
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
                                                Obx(
                                                  () => Text(
                                                    weight.value,
                                                    style: Styles.black14(),
                                                  ),
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
                                                Obx(
                                                  () => Text(
                                                    microchipNumber.value,
                                                    style: Styles.black14(),
                                                  ),
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
                                      width: 116,
                                      height: 116,
                                      child: Obx(() => Image.network(
                                            photoUrl.value,
                                          )),
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
            ],
          ),
        )),
      ),
    );
  }
}

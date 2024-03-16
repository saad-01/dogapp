import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/requested_widget.dart';

class AppointmentDetailPage extends StatefulWidget {
  const AppointmentDetailPage({super.key});

  @override
  State<AppointmentDetailPage> createState() => _AppointmentDetailPageState();
}

class _AppointmentDetailPageState extends State<AppointmentDetailPage> {
  final QueryDocumentSnapshot<Object> doc = Get.arguments;
  RxString name = ''.obs;
  getDogName(String id) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection(
            'dogs') // Replace 'your_collection' with your collection name
        .doc(id) // Replace 'your_document_id' with your document ID
        .get();
    dynamic fieldValue = snapshot.get('name');
    name.value = fieldValue.toString();
  }

  @override
  void initState() {
    getDogName(doc['dogId']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.appointDetail.tr),
            const SizedBox(
              height: 20,
            ),
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
                          color: Colors.black.withOpacity(0.11999999731779099),
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.edit.tr,
                              style: Styles.primary16U(),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 110.0),
                          child: Divider(
                            color: Color(0xFFA8A8A8),
                          ),
                        ),
                        Text(
                          doc['vaccinationType'],
                          style: Styles.expertSignupPaget1(),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${AppStrings.appointType.tr}:',
                                style: Styles.grey14()),
                            Text(
                              doc['type'],
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        const SizedBox(
                          height: 5,
                        ),
                        if (doc['status'] != 'Requested')
                          StatusItem(
                              title: doc['status'],
                              approval:
                                  doc['status'] == 'Approved' ? true : false),
                        if (doc['status'] == 'Requested')
                          RequestedWidget(
                            title: doc['status'],
                          ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: SvgPicture.asset(AssetImages.injectionLg))
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class StatusItem extends StatelessWidget {
  const StatusItem(
      {super.key, this.color, required this.title, required this.approval});
  final Color? color;
  final String title;
  final bool approval;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101,
      height: 28,
      decoration: ShapeDecoration(
        color: approval ? AppColors.statusBg1 : AppColors.statusBg2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      ),
      child: Center(
          child: Text(
        title.tr,
        style: approval ? Styles.primary12UText() : Styles.denialTxt(),
      )),
    );
  }
}

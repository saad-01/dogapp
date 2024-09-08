import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/coupon_item.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/view_models/coupon_codes_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';

class CouponCodes extends StatefulWidget {
  const CouponCodes({super.key});

  @override
  State<CouponCodes> createState() => _CouponCodesState();
}

class _CouponCodesState extends State<CouponCodes> {
  final controller = Get.put(CouponCodesController());
  @override
  void initState() {
    controller.checkAppointmentsAndCreateCoupon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.couponCodes.tr),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('coupons')
                          .where(
                            'parentId',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid,
                          )
                          .where(
                            'status',
                            isEqualTo: "Active",
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
                              return Column(
                                children: [
                                  CouponItem(
                                    heading: doc['code'],
                                    expertName: doc['expertName'],
                                    onPress: () {
                                      // When the user taps on a coupon, show a snackbar
                                      Clipboard.setData(
                                          ClipboardData(text: doc['code']));
                                      Utils.snackBar(AppStrings.success.tr,
                                          AppStrings.copied.tr);
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
              ),
            )
          ],
        ),
      )),
    );
  }
}

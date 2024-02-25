import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:get/get.dart';

class AppointExpertModel extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  updateStatus(String id, String status) async {
    DocumentReference docRef = firestore.collection('appointments').doc(id);
    try {
      await docRef.update({
        'status': status,
      });
      Get.back();
      Utils.snackBar(AppStrings.success, AppStrings.success);
    } catch (e) {
      Utils.snackBar(AppStrings.error, AppStrings.error);
    }
  }
  release(String id) async {
    DocumentReference docRef = firestore.collection('appointments').doc(id);
    try {
      await docRef.update({
        'releaseFlag': true,
      });
      Get.back();
      Utils.snackBar(AppStrings.success, AppStrings.success);
    } catch (e) {
      Utils.snackBar(AppStrings.error, AppStrings.error);
    }
  }
}

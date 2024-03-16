import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:get/get.dart';

class DeleteDog {
  void deleteDog(String id) async {
    try {
      // Get a reference to the document
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('dogs').doc(id);

      // Delete the document
      await docRef.delete();
      Get.back();
      Utils.snackBar(AppStrings.success.tr, AppStrings.dogdeleted.tr);
    } catch (e) {
      Utils.snackBar(AppStrings.error.tr, e.toString());
    }
  }
}

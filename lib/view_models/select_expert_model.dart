import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SelectExpertModel extends GetxController {
  final RxString name = ''.obs;
  final RxString url = ''.obs;
  final RxString expertis = ''.obs;
  final RxString id = ''.obs;
  setData(QueryDocumentSnapshot<Object?> doc) {
    name.value = doc['name'];
    url.value = doc['photoUrl'];
    id.value = doc['uid'];
    expertis.value = doc['speciality'];
  }
}

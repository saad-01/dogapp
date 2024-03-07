import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/strings.dart';
import '../utils/utils.dart';

class BaitModel extends GetxController {
  final markers = <Marker>[].obs;
  final RxBool sendNoti = false.obs;
  final RxBool loading = false.obs;
  void addMarker(LatLng position) {
    markers.add(
      Marker(
        markerId: MarkerId(DateTime.now().toString()), // Unique marker ID
        position: position,
        infoWindow: const InfoWindow(title: AppStrings.dogBait),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
    FirebaseFirestore.instance.collection('markers').add({
      'latitude': position.latitude,
      'longitude': position.longitude,
      'title': AppStrings.dogBait,
      // Add any other relevant data you want to store
    }).then((value) {
      if (kDebugMode) {
        print('Marker added to Firebase');
      }
    }).catchError((error) {
      if (kDebugMode) {
        print('Failed to add marker to Firebase: $error');
      }
    });
    Get.back();
    Utils.snackBar(AppStrings.success, AppStrings.dogAdded);
  }
}

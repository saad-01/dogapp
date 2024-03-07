import 'dart:async';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/view_models/bait_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../components/appbar.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  dynamic mapController;
  final vm = Get.put(BaitModel());
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CustomAppBar(title: AppStrings.mapView),
            ),
            Expanded(
              child: FutureBuilder(
                future: getCurrentLocation(),
                builder: (context, AsyncSnapshot<Position> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Obx(() => GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              snapshot.data!.latitude,
                              snapshot.data!.longitude,
                            ),
                            zoom: 14,
                          ),
                          myLocationEnabled: true,
                          markers: Set<Marker>.from(vm.markers),
                          myLocationButtonEnabled: true,
                          onMapCreated: (GoogleMapController controller) {
                            mapController = controller;
                          },
                          onTap: vm.addMarker,
                        ));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

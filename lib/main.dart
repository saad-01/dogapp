import 'dart:developer';

import 'package:dogapp/firebase_options.dart';
import 'package:dogapp/routes/routes.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

import 'view_models/services/local_noti_services.dart';
import 'view_models/services/localization.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  LocalNotificationService.display(message);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PermissionStatus locationStatus = await Permission.location.status;

  // Only request permission if it's not granted or permanentlyDenied
  if (locationStatus != PermissionStatus.granted &&
      locationStatus != PermissionStatus.permanentlyDenied) {
    // Request location permission
    await Permission.location.request();
  }

  // Check if the location service is enabled
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location service is not enabled, handle it accordingly
    return;
  }
  GetStorage boxStorage = GetStorage();
  boxStorage.write('server_key',
      'AAAAgYJteF0:APA91bFvTR-M__u9GX-ApSPcie4GIHpKOhQ1H18KYQrRvEaKL7RVlXkfPtPUjeKjC754qG7dt8iGi0MF8SPp4GfQ8Vh_1d1R1pKa0J8HXzkTtO89CIebnr9hae1zhdRIwBXJPdWrMGXD');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    FirebaseMessaging.instance.getInitialMessage().then((message) {});

    ///forground messages
    FirebaseMessaging.onMessage.listen((message) {
      log('foreground messages----->>');
      log(message.notification.toString());
      if (message.notification != null) {
        log(message.notification!.body.toString());
        log(message.notification!.title.toString());
      }

      LocalNotificationService.display(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MY DOG',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
        fontFamily: "Kanit",
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppRoutes.appRoutes(),
      translations: AppTranslation(),
      locale: AppTranslation.locale,
      fallbackLocale: AppTranslation.fallbackLocale,
      translationsKeys: AppTranslation.translationsKeys,
    );
  }
}

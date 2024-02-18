import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/view_models/services/auth_services.dart';
import 'package:dogapp/view_models/services/notification_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uuid/uuid.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<String> tokens = [];

  NotificationServices notificationServices = NotificationServices();

  Future<void> sendNoti() async {
    // tokens.add(
    //     "f83mqeSkR0SlvGP-bCytW2:APA91bGVQB-X1LuXvgaP0x10cb0vZBk29ZPGLJcHpIEmQabUFDFfYxk6H2Vhyfq1Xf3KDtFvpELnj27UI-lrmMGNUsBSIPQhIft4nsuT-hME17_hKmdc9Wrf8e6tYQl-lhk1qUFDncMT");
    notificationServices.requestNotificationPermission();
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value) async {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      String id = const Uuid().v1();
      await firestore.collection("tokens").doc(id).set({
        'token': value,
      });
      if (kDebugMode) {
        print('Device Token');
      }
      if (kDebugMode) {
        print(value);
      }
    });
    // await FirebaseAPIServices().sendPushNotifications(
    //     title: "add values", body: "add values", token: tokens);
  }

  @override
  void initState() {
    sendNoti();
    AuthMethods auth = AuthMethods();

    Timer(
      const Duration(seconds: 5),
      () {
        auth.isLogin();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.23, -0.97),
                  end: Alignment(0.23, 0.97),
                  colors: [AppColors.primaryColor, AppColors.gradientColor],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AssetImages.dogImage),
                  Text(
                    AppStrings.myDog,
                    style: Styles.splashHeading(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

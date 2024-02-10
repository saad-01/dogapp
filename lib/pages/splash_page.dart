import 'dart:async';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/view_models/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
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

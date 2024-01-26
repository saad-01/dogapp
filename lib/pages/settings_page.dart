import 'package:dogapp/components/list_tile.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/view_models/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                AppStrings.settings,
                style: Styles.expertSignupPageH1(),
              ),
              const SizedBox(
                height: 35,
              ),
              Container(
                height: 90,
                padding: const EdgeInsets.all(15),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      color: Colors.black.withOpacity(0.11999999731779099),
                    ),
                    borderRadius: BorderRadius.circular(8),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AssetImages.expertIcon),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Name",
                              style: Styles.expertSignupPaget1(),
                            ),
                            Text(
                              "yourmail@gmail.com",
                              style: Styles.subText(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SvgPicture.asset(AssetImages.nextBlackIcon)
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomListTile(
                trailing: AssetImages.nextBlackIcon,
                title: AppStrings.notifications,
                color: AppColors.white,
                style: Styles.expertSignupPaget1(),
                onPress: () {
                  Get.toNamed(RouteName.notificationsPage);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                trailing: AssetImages.nextBlackIcon,
                title: AppStrings.manageDogs,
                color: AppColors.white,
                style: Styles.expertSignupPaget1(),
                onPress: () {
                  Get.toNamed(RouteName.dogManagePage);
                },
              ),
              const SizedBox(
                height: 50,
              ),
              CustomListTile(
                trailing: AssetImages.nextBlackIcon,
                title: AppStrings.giveFeedback,
                color: AppColors.white,
                style: Styles.expertSignupPaget1(),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                trailing: AssetImages.nextBlackIcon,
                title: AppStrings.termsOfUse,
                color: AppColors.white,
                style: Styles.expertSignupPaget1(),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                trailing: AssetImages.logoutIcon,
                title: AppStrings.logout,
                color: AppColors.white,
                style: Styles.primaryText(),
                onPress: () async {
                  AuthMethods auth = AuthMethods();
                  await auth.signOut();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                trailing: AssetImages.deleteIcon,
                title: AppStrings.deleteAccount,
                color: const Color(0xFFFFEBEB),
                style: Styles.deleteText(),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

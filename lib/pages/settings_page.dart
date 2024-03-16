import 'package:dogapp/components/list_tile.dart';
import 'package:dogapp/components/pic_container.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/view_models/services/auth_services.dart';
import 'package:dogapp/view_models/services/shared_prefence.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_tile.dart';
import '../models/user_model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SharedPref prefs = SharedPref();
  UserModel user = UserModel();
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString photoUrl = ''.obs;
  RxString role = ''.obs;
  Future<void> getUser() async {
    user = await prefs.getUser();
    name.value = user.name!;
    email.value = user.email!;
    photoUrl.value = user.photoUrl!;
    role.value = user.role!;
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getUser();
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
                AppStrings.settings.tr,
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
                    Obx(
                      () => Row(
                        children: [
                          PicContainer(
                            width: 58,
                            height: 58,
                            child: Image.network(
                              photoUrl.value == ''
                                  ? 'https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM='
                                  : photoUrl.value,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name.value,
                                style: Styles.expertSignupPaget1(),
                              ),
                              Text(
                                email.value,
                                style: Styles.subText(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // SvgPicture.asset(AssetImages.nextBlackIcon)
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomTile(
                title: AppStrings.safetyEmergency.tr,
                leading: AssetImages.dogBelt,
                trailing: AssetImages.nextWhiteIcon,
                clr: const Color(0xFF007F84),
                onPress: () {
                  Get.toNamed(RouteName.safetyEmergencyPage);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTile(
                title: AppStrings.gotoCommunity.tr,
                leading: AssetImages.communityIcon,
                trailing: AssetImages.nextWhiteIcon,
                clr: const Color(0xFFB25423),
                onPress: () {
                  Get.toNamed(RouteName.communityPage);
                },
              ),
              const SizedBox(
                height: 50,
              ),
              CustomListTile(
                trailing: AssetImages.nextBlackIcon,
                title: AppStrings.notifications.tr,
                color: AppColors.white,
                style: Styles.expertSignupPaget1(),
                onPress: () {
                  Get.toNamed(RouteName.notificationsPage);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => role.value == 'parent'
                    ? CustomListTile(
                        trailing: AssetImages.nextBlackIcon,
                        title: AppStrings.manageDogs.tr,
                        color: AppColors.white,
                        style: Styles.expertSignupPaget1(),
                        onPress: () {
                          Get.toNamed(RouteName.dogManagePage);
                        },
                      )
                    : const SizedBox(),
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              // CustomListTile(
              //   trailing: AssetImages.nextBlackIcon,
              //   title: AppStrings.giveFeedback.tr,
              //   color: AppColors.white,
              //   style: Styles.expertSignupPaget1(),
              // ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                trailing: AssetImages.nextBlackIcon,
                title: AppStrings.termsOfUse.tr,
                color: AppColors.white,
                style: Styles.expertSignupPaget1(),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomListTile(
                trailing: AssetImages.logoutIcon,
                title: AppStrings.logout.tr,
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
                title: AppStrings.deleteAccount.tr,
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

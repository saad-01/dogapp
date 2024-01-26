import 'package:dogapp/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/appoint_widget.dart';
import '../components/dog_widget.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class ExpertHomePage extends StatefulWidget {
  const ExpertHomePage({super.key});

  @override
  State<ExpertHomePage> createState() => _ExpertHomePageState();
}

class _ExpertHomePageState extends State<ExpertHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${AppStrings.hey}Jacob",
                      style: Styles.homeH1(),
                    ),
                    Text(
                      "${AppStrings.welcome}MY DOG!",
                      style: Styles.expertSignupPaget1(),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteName.notificationsPage);
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, right: 5),
                        child: SvgPicture.asset(AssetImages.bellIcon),
                      ),
                      Positioned(
                          right: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: const ShapeDecoration(
                              color: AppColors.primaryColor,
                              shape: OvalBorder(),
                            ),
                            child: const Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "2",
                                style: TextStyle(
                                    fontSize: 8, color: AppColors.white),
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SvgPicture.asset(AssetImages.horizontalDivider),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.underCare,
                style: Styles.expertSignupPaget1(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            DogWidget(
              name: '',
              date: '',
              url: '',
              onPress: () {
                Get.toNamed(RouteName.expertdogDetailsPage);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DogWidget(
              name: '',
              date: '',
              url: '',
              onPress: () {
                Get.toNamed(RouteName.expertdogDetailsPage);
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.requests,
                  style: Styles.expertSignupPaget1(),
                ),
                Row(
                  children: [
                    Text(
                      AppStrings.seeAll,
                      style: Styles.subYellowText(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(AssetImages.nextYellowIcon)
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            AppointmentWidget(
              type: AppStrings.vaccination,
              name: AppStrings.dogName,
              date: AppStrings.dateFormat,
              time: AppStrings.time,
              image: AssetImages.injectionImage,
              title: AppStrings.approved,
              approvalFlag: true,
              onPress: () {
                Get.toNamed(RouteName.appointExpertPage, arguments: 'Approved');
              },
            ),
            const SizedBox(
              height: 11,
            ),
            AppointmentWidget(
              type: AppStrings.medicine,
              name: AppStrings.dogName,
              date: AppStrings.dateFormat,
              time: AppStrings.time,
              image: AssetImages.medImage,
              title: AppStrings.requested,
              approvalFlag: false,
              onPress: () {
                Get.toNamed(RouteName.appointExpertPage,
                    arguments: 'Requested');
              },
            ),
          ]),
        ),
      )),
    );
  }
}

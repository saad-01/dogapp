import 'package:dogapp/components/appoint_widget.dart';
import 'package:dogapp/components/dog_widget.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../routes/route_names.dart';

class ParentHomePage extends StatefulWidget {
  const ParentHomePage({super.key});

  @override
  State<ParentHomePage> createState() => _ParentHomePageState();
}

class _ParentHomePageState extends State<ParentHomePage> {
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
                Stack(
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
            DogWidget(
              onPress: () {
                Get.toNamed(RouteName.dogDetailsPage);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            DogWidget(
              onPress: () {
                Get.toNamed(RouteName.dogDetailsPage);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            PrimartyButton(
              title: AppStrings.addDog,
              width: 170,
              height: 12,
              icon: AssetImages.addWhiteIcon,
              onTap: () {
                Get.toNamed(RouteName.addDogPage);
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.upcommingAppointments,
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
            const AppointmentWidget(
                type: AppStrings.vaccination,
                name: AppStrings.dogName,
                date: AppStrings.dateFormat,
                time: AppStrings.time,
                image: AssetImages.injectionImage,
                title: AppStrings.approved,
                approvalFlag: true),
            const SizedBox(
              height: 11,
            ),
            const AppointmentWidget(
                type: AppStrings.medicine,
                name: AppStrings.dogName,
                date: AppStrings.dateFormat,
                time: AppStrings.time,
                image: AssetImages.medImage,
                title: AppStrings.denied,
                approvalFlag: false),
          ]),
        ),
      )),
    );
  }
}

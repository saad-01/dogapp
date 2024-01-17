import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/expert_item.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/appoint_widget.dart';
import '../routes/route_names.dart';
import '../utils/assets.dart';

class AppointmentsPage extends StatelessWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const CustomAppBar(title: AppStrings.appointments),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const ExpertItem(
                    expertis: AppStrings.trainingExpert, filledBtnTitle: ''),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.appointments,
                    style: Styles.appBarH1(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                AppointmentWidget(
                    type: AppStrings.vaccination,
                    name: AppStrings.dogName,
                    date: AppStrings.dateFormat,
                    time: AppStrings.time,
                    image: AssetImages.injectionImage,
                    title: AppStrings.approved,
                    onPress: () {
                      Get.toNamed(RouteName.appointDetailsPage);
                    },
                    approvalFlag: true),
                const SizedBox(
                  height: 15,
                ),
                AppointmentWidget(
                    type: AppStrings.medicine,
                    name: AppStrings.dogName,
                    date: AppStrings.dateFormat,
                    time: AppStrings.time,
                    image: AssetImages.medImage,
                    title: AppStrings.noAction,
                    onPress: () {
                      Get.toNamed(RouteName.appointDetailsPage);
                    },
                    approvalFlag: false),
                const SizedBox(
                  height: 15,
                ),
                AppointmentWidget(
                    type: AppStrings.vaccination,
                    name: AppStrings.dogName,
                    date: AppStrings.dateFormat,
                    time: AppStrings.time,
                    image: AssetImages.injectionImage,
                    title: AppStrings.approved,
                    onPress: () {
                      Get.toNamed(RouteName.appointDetailsPage);
                    },
                    approvalFlag: true),
                const SizedBox(
                  height: 15,
                ),
                AppointmentWidget(
                    type: AppStrings.medicine,
                    name: AppStrings.dogName,
                    date: AppStrings.dateFormat,
                    time: AppStrings.time,
                    image: AssetImages.medImage,
                    title: AppStrings.denied,
                    onPress: () {
                      Get.toNamed(RouteName.appointDetailsPage);
                    },
                    approvalFlag: false),
              ],
            ),
          ))
        ]),
      )),
    );
  }
}

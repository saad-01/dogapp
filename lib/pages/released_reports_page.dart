import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/expert_item.dart';
import 'package:dogapp/components/training_streak.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReleasedReportsPage extends StatelessWidget {
  const ReleasedReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          CustomAppBar(title: AppStrings.releasedReports.tr),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ExpertItem(
                    expertis: AppStrings.trainingExpert.tr, filledBtnTitle: ''),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppStrings.releasedReports.tr,
                    style: Styles.appBarH1(),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const TrainingStreakWidget(),
                const SizedBox(
                  height: 15,
                ),
                const TrainingStreakWidget(),
              ],
            ),
          ))
        ]),
      )),
    );
  }
}

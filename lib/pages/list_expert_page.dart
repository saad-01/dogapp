import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/expert_item.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';

class ListExpertPage extends StatelessWidget {
  const ListExpertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: const Column(
          children: [
            CustomAppBar(title: AppStrings.selectExpertSingle),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ExpertItem(
                      expertis: AppStrings.trainExpert,
                      filledBtnTitle: AppStrings.relReport,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    ExpertItem(
                      expertis: AppStrings.healthExpert,
                      filledBtnTitle: AppStrings.relReport,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

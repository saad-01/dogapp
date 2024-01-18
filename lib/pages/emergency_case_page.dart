import 'package:dogapp/components/alternating_btn.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/expert_item.dart';
import 'package:dogapp/components/pdf_file_item.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';

class EmergencyCasePage extends StatelessWidget {
  const EmergencyCasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.caseOfEmergency),
            Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ExpertItem(
                          expertis: AppStrings.preparedByExpert,
                          filledBtnTitle: ''),
                      const SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.description,
                          style: Styles.appBarH1(),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Lorem ipsum dolor sit amet consectetur. Massa sagittis eget enim mauris sem id diam in. Lorem ipsum dolor sit amet consectetur. Massa sagittis eget enim mauris sem id diam in. Lorem ipsum dolor sit amet consectetur. Massa sagittis eget enim mauris sem id diam in. Lorem ipsum dolor sit amet consectetur. Massa sagittis eget enim mauris sem id diam in. Lorem ipsum dolor sit amet consectetur. Massa sagittis eget enim mauris sem id diam in. Lorem ipsum dolor sit amet consectetur. Massa sagittis eget enim mauris sem id diam in.',
                          style: Styles.choosePageText(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.articles,
                          style: Styles.appBarH1(),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PdfFileItem(),
                          PdfFileItem(),
                          PdfFileItem(),
                        ],
                      ),
                    ],
                  ),
                )),
            const Spacer(),
            AlternatingButton(
                title: AppStrings.share,
                outlined: true,
                width: MediaQuery.sizeOf(context).width * 0.81,
                height: 52,
                style: Styles.primary20(),
                withIcon: false),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}

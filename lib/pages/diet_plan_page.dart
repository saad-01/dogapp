import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/pdf_file_item.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class DietPlanPage extends StatelessWidget {
  const DietPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.dietPlan),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
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
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.notes,
                      style: Styles.appBarH1(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: ShapeDecoration(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0x3F737373)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x0F000000),
                          blurRadius: 6,
                          offset: Offset(-2, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.timing, style: Styles.grey14()),
                            Text(AppStrings.time, style: Styles.black14()),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.calories, style: Styles.grey14()),
                            Text('0000', style: Styles.black14()),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.doze, style: Styles.grey14()),
                            Text('256lb', style: Styles.black14()),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.duration, style: Styles.grey14()),
                            Text('1 Month Daily', style: Styles.black14()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}

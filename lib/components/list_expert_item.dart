import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';
import 'alternating_btn.dart';

class ListExpertItem extends StatelessWidget {
  const ListExpertItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 0.50,
            color: AppColors.black.withOpacity(0.11999999731779099),
          ),
          borderRadius: BorderRadius.circular(10),
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
        children: [
          Image.asset(AssetImages.expertDp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'K. Devis',
                style: Styles.primaryText(),
              ),
              Text(
                "Dain's Trainer and expert",
                style: Styles.lightGrey12(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    decoration: ShapeDecoration(
                      color: AppColors.statusBg1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.appointments,
                            style: Styles.primary8Txt(),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '2',
                            style: Styles.primary10Txt(),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                    decoration: ShapeDecoration(
                      color: AppColors.statusBg1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.releasedReport,
                            style: Styles.primary8Txt(),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '12',
                            style: Styles.primary10Txt(),
                          ),
                        ]),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  AlternatingButton(
                    title: AppStrings.seeProfile,
                    outlined: true,
                    withIcon: false,
                    width: 80,
                    height: 28,
                    style: Styles.primary10Txt(),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  AlternatingButton(
                    title: AppStrings.chat,
                    outlined: false,
                    withIcon: false,
                    width: 80,
                    height: 28,
                    style: Styles.white10Txt(),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

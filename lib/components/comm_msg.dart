import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class CommunityMsgItem extends StatelessWidget {
  const CommunityMsgItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: AppColors.white.withOpacity(0.8799999952316284),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0x260C274F)),
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x16000000),
            blurRadius: 12,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(AssetImages.smallIcon),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Nicklin(Dog Expert)',
                    style: Styles.subPrimaryText(),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    AppStrings.now.tr,
                    style: Styles.lightGrey12(),
                  ),
                ],
              ),
              Text(
                AppStrings.seeAll.tr,
                style: Styles.subPrimaryText(),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                AppStrings.bestWay.tr,
                style: Styles.primaryText(),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor',
            style: Styles.grey14(),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

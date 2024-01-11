import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/app_colors.dart';

class IntroDogWidget extends StatelessWidget {
  const IntroDogWidget({super.key, this.onPress});
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPress,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
            children: [
              Container(
                width: 94,
                height: 94,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage(AssetImages.dogItem),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        width: 1.50, color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              const SizedBox(
                width: 14,
              ),
              SvgPicture.asset(AssetImages.verticalDivider),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.nameCapital,
                      style: Styles.expertSignupPaget1(),
                    ),
                    Text(
                      AppStrings.dateFormat,
                      style: Styles.black10Sub(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppStrings.missNote,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.grey10(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.yourNumber,
                          style: Styles.grey10(),
                        ),
                        Text('+10000000000', style: Styles.black10Sub())
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          AppStrings.seeProfile,
                          style: Styles.primary12UText(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(AssetImages.nextPrimaryIcon)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

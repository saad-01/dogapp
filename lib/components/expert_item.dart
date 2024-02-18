import 'package:flutter/material.dart';
import 'package:dogapp/components/alternating_btn.dart';
import 'package:dogapp/components/expertise_widget.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter_svg/svg.dart';

class ExpertItem extends StatelessWidget {
  const ExpertItem(
      {super.key,
      required this.expertis,
      required this.filledBtnTitle,
      this.onPress,
      this.name, this.url});
  final String expertis;
  final String filledBtnTitle;
  final String? name;
  final String? url;
  final void Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: ShapeDecoration(
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.50,
              color: AppColors.black.withOpacity(0.11999999731779099),
            ),
            borderRadius: BorderRadius.circular(8),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ExpertiseWidget(title: expertis),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 67,
                  height: 67,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(url??'https://e7.pngegg.com/pngimages/84/165/png-clipart-united-states-avatar-organization-information-user-avatar-service-computer-wallpaper.png'),
                      fit: BoxFit.cover,
                    ),
                    shape: const OvalBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                SvgPicture.asset(AssetImages.expertItemDiv),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      name ?? 'K.Devis',
                      style: Styles.expertSignupPaget1(),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.55,
                      child: Text(
                        AppStrings.expertAbout,
                        style: Styles.grey8(),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AlternatingButton(
                  title: AppStrings.chat,
                  outlined: true,
                  withIcon: false,
                  width: 102,
                  height: 28,
                  style: Styles.primary10Txt(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

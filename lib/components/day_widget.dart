import 'package:dogapp/components/alternating_btn.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';

class DayWidget extends StatefulWidget {
  const DayWidget({super.key, required this.title, required this.controller});
  final String title;
  final TextEditingController controller;
  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  final RxBool showDropDown = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          decoration: ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                color: AppColors.black.withOpacity(0.11999999731779099),
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x1E000000),
                blurRadius: 8,
                offset: Offset(0, 0),
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
                      SvgPicture.asset(AssetImages.day),
                      const SizedBox(
                        width: 18,
                      ),
                      Text(
                        '${AppStrings.day} ${widget.title}',
                        style: Styles.appBarH1(),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      if (showDropDown.value) {
                        showDropDown.value = false;
                      } else {
                        showDropDown.value = true;
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => SvgPicture.asset(
                            showDropDown.value
                                ? AssetImages.blackUp
                                : AssetImages.primaryDown,
                            colorFilter: const ColorFilter.mode(
                                AppColors.primaryColor, BlendMode.srcIn)),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() => Visibility(
                  visible: showDropDown.value,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.description.tr,
                          style: Styles.expertSignupPaget1(),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: const EdgeInsets.all(12),
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
                        child: TextField(
                          maxLines: null,
                          controller: widget.controller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: Styles.expertSignupPaget2(),
                              hintText: AppStrings.giveDescription.tr),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppStrings.uploadFiles.tr,
                          style: Styles.expertSignupPaget1(),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          AlternatingButton(
                            title: AppStrings.media.tr,
                            outlined: false,
                            width: 139,
                            height: 54,
                            icon: AssetImages.galleryIcon,
                            withIcon: true,
                            style: Styles.white16(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AlternatingButton(
                            title: AppStrings.files.tr,
                            outlined: true,
                            width: 139,
                            height: 54,
                            icon: AssetImages.fileIcon,
                            withIcon: true,
                            style: Styles.primaryText(),
                          ),
                        ],
                      ),
                    ],
                  ))),
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}

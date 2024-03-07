import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/view_models/bait_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/primary_btn.dart';
import '../utils/app_colors.dart';

class DogBaitPage extends StatefulWidget {
  const DogBaitPage({super.key});

  @override
  State<DogBaitPage> createState() => _DogBaitPageState();
}

class _DogBaitPageState extends State<DogBaitPage> {
  final vm = Get.put(BaitModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(
              title: AppStrings.dogBait,
            ),
            Image.asset(
              AssetImages.dogBaitLg,
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteName.mapPage);
              },
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: ShapeDecoration(
                  color: const Color(0xFFFFFDF4),
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0x3F737373)),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.addBaitLocation,
                      style: Styles.black14(),
                    ),
                    SvgPicture.asset(AssetImages.location)
                  ],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Obx(
                      () => Checkbox(
                        value: vm.sendNoti.value,
                        onChanged: (value) {
                          vm.sendNoti.value = value!;
                        },
                        side: const BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF018383),
                        ),
                        activeColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFF018383),
                            ),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    AppStrings.sendNotiAll,
                    style: Styles.expertSignupPaget1(),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            PrimartyButton(
                title: AppStrings.share,
                width: MediaQuery.sizeOf(context).width * 0.75,
                height: 10,
                onTap: () {
                  Get.back();
                },
                icon: ''),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}

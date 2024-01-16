import 'package:dogapp/components/recieved_msg.dart';
import 'package:dogapp/components/sender_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            // height: 130,
            decoration: ShapeDecoration(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.50,
                  color: Colors.black.withOpacity(0.11999999731779099),
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x14000000),
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
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(9),
                            onTap: () {
                              Get.back();
                            },
                            child: Ink(
                              width: 59,
                              height: 40,
                              decoration: ShapeDecoration(
                                color: AppColors.primaryColor.withOpacity(0.20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9)),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x1E000000),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Center(
                                child: SvgPicture.asset(AssetImages.backIcon),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nicklin',
                              style: Styles.appBarH1(),
                            ),
                            Text(
                              'Last online: 2 min ago',
                              style: Styles.black10Sub(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      AssetImages.dp,
                      height: 34,
                      width: 34,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset(AssetImages.horizontalDivider),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 15,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SenderMsg(),
                    const SizedBox(
                      height: 20,
                    ),
                    const RecievedMsg(),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(AssetImages.demoImage),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '10:28 AM',
                      style: Styles.black10Sub(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(AssetImages.demoVideo),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '10:28 AM',
                      style: Styles.black10Sub(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: ShapeDecoration(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.50,
                  color: AppColors.black.withOpacity(0.11999999731779099),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 12,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    // height: 48,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
                    decoration: ShapeDecoration(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 0.10,
                          color:
                              AppColors.black.withOpacity(0.6100000143051147),
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
                          children: [
                            SvgPicture.asset(AssetImages.emoji),
                            const SizedBox(
                              width: 20,
                            ),
                            const Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: AppStrings.connectExperts,
                                  hintStyle: TextStyle(
                                    color: Color(0x420A0A0A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )),
                            )),
                            const SizedBox(
                              width: 20,
                            ),
                            SvgPicture.asset(AssetImages.attach),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(AssetImages.primaryCam),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SvgPicture.asset(AssetImages.sendBtn),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

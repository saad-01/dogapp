import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';

import '../components/primary_btn.dart';
import '../components/textfield.dart';
import '../utils/styles.dart';

class MakeAnnouncementPage extends StatelessWidget {
  const MakeAnnouncementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.makeAnnouncement),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.title,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomTextfield(
                      hintText: AppStrings.giveTitle,
                      obscureText: false,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.description,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const CustomTextfield(
                      hintText: AppStrings.makeAnnouncement,
                      obscureText: false,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFF018383),
                                ),
                                borderRadius: BorderRadius.circular(6)),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          AppStrings.sendNoti,
                          style: Styles.expertSignupPaget1(),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PrimartyButton(
                        title: AppStrings.share,
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 10,
                        icon: '')
                  ],
                )
              ],
            ))
          ],
        ),
      )),
    );
  
  }
}

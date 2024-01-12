import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/cmnt_item.dart';
import 'package:dogapp/components/miss_dog_item.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/styles.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CustomAppBar(title: AppStrings.notifications),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: ShapeDecoration(
                  color: const Color(0x38ECECEC),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      color: Colors.black.withOpacity(0.11999999731779099),
                    ),
                    borderRadius: BorderRadius.circular(10),
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
                child: TabBar(
                  unselectedLabelColor: AppColors.black,
                  labelColor: AppColors.white,
                  unselectedLabelStyle: Styles.expertSignupPaget1(),
                  labelStyle: Styles.white16UTxt(),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  indicatorColor: AppColors.primaryColor,
                  splashBorderRadius: BorderRadius.circular(10),
                  tabs: const <Widget>[
                    Tab(
                      text: AppStrings.notifications,
                    ),
                    Tab(
                      text: AppStrings.comments,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Expanded(
                  child: TabBarView(children: [
                SingleChildScrollView(
                  child: Center(
                    child: MissDogItem(title: AppStrings.missingDog),
                  ),
                ),
                SingleChildScrollView(
                  child: Center(
                    child: CommentItem(title: AppStrings.commentTitle),
                  ),
                ),
              ])),
            ],
          ),
        )),
      ),
    );
  }
}

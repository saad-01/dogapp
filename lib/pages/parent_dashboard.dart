import 'package:dogapp/pages/calendar_page.dart';
import 'package:dogapp/pages/parent_home_page.dart';
import 'package:dogapp/pages/settings_page.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ParentDashboard extends StatefulWidget {
  const ParentDashboard({super.key});

  @override
  State<ParentDashboard> createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  RxInt selectedPage = 0.obs;
  changeTab(int index) {
    selectedPage.value = index;
  }

  List pages = [
    const Center(
      child: ParentHomePage(),
    ),
    const Center(
      child: CalendarPage(),
    ),
    const Center(
      child: SettingsPage(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[selectedPage.value],
        bottomNavigationBar: Obx(
          () => Container(
            height: 80,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 8,
                  offset: Offset(0, -2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: BottomNavigationBar(
                currentIndex: selectedPage.value,
                onTap: (value) {
                  changeTab(value);
                },
                selectedItemColor: AppColors.primaryColor,
                unselectedItemColor: AppColors.grey,
                items: [
                  BottomNavigationBarItem(
                      icon: selectedPage.value == 0
                          ? SvgPicture.asset(AssetImages.homeIcon)
                          : SvgPicture.asset(AssetImages.notActiveHomeIcon),
                      label: AppStrings.home),
                  BottomNavigationBarItem(
                      icon: selectedPage.value == 1
                          ? SvgPicture.asset(AssetImages.activeCalendarIcon)
                          : SvgPicture.asset(
                              AssetImages.calendarIcon,
                            ),
                      label: AppStrings.calendar),
                  BottomNavigationBarItem(
                      icon: selectedPage.value == 2
                          ? SvgPicture.asset(AssetImages.activeSettingsIcon)
                          : SvgPicture.asset(AssetImages.settingsIcon),
                      label: AppStrings.settings),
                ]),
          ),
        ),
      ),
    );
  }
}

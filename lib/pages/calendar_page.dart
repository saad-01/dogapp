import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              AppStrings.eventCalendar,
              style: Styles.appBarH1(),
            ),
            Expanded(
                child: GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteName.addReminder);
                    },
                    child: SvgPicture.asset(AssetImages.calendar))),
          ],
        ),
      )),
    );
  }
}

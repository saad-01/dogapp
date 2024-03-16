import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/event_item.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/user_model.dart';
import '../view_models/services/shared_prefence.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  List<Event> events = [];
  SharedPref prefs = SharedPref();
  UserModel user = UserModel();
  RxString role = ''.obs;
  Future<void> getUser() async {
    user = await prefs.getUser();
    role.value = user.role!;
  }

  void _addSampleEvents() {
    // Assuming you have a reference to your Firebase collection named 'eventsCollection'
    FirebaseFirestore.instance.collection('events').get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data();

        // Convert string values to appropriate types
        DateTime date = DateFormat('dd.MM.yyyy').parse(data['date']);
        String title = data['title'];
        String subTitle = data['subtitle'];
        String location = data['location'];
        String time = data['time'];

        // Create Event object and add it to your events list
        events.add(Event(
          date: date,
          title: title,
          subTitle: subTitle,
          location: location,
          time: time,
        ));
      }
    });
  }

  List<Widget> buildTimeSlots(List<Event> events, DateTime selectedDate) {
    List<Widget> timeSlots = [];

    for (int index = 0; index < 24; index++) {
      String hour = (index).toString().padLeft(2, '0');
      String eventsForHour = '';
      String title = '';
      String subtitle = '';
      String location = '';
      String time = '';

      // Filter events for the selected date and current hour
      List<Event> filteredEvents = events.where((event) {
        return event.date.year == selectedDate.year &&
            event.date.month == selectedDate.month &&
            event.date.day == selectedDate.day &&
            event.time?.startsWith(hour) == true;
      }).toList();

      // Construct eventsForHour string
      for (Event event in filteredEvents) {
        eventsForHour += '${event.time}: ${event.title}\n';
        title = event.title;
        subtitle = event.subTitle!;
        location = event.location!;
        time = event.time!;
      }

      timeSlots.add(
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$hour:00',
                style: Styles.black14(),
              ),
              const Divider(),
              const SizedBox(height: 8),
              if (eventsForHour.isNotEmpty)
                EventItem(
                    title: title,
                    subTitle: subtitle,
                    location: location,
                    time: time),
            ],
          ),
        ),
      );
    }

    return timeSlots;
  }

  @override
  void initState() {
    super.initState();
    _addSampleEvents();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                AppStrings.eventCalendar.tr,
                style: Styles.appBarH1(),
              ),
              TableCalendar(
                firstDay: DateTime.utc(2024, 1, 1),
                lastDay: DateTime.utc(2025, 1, 31),
                focusedDay: _focusedDay,
                startingDayOfWeek: StartingDayOfWeek.monday,
                selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
                eventLoader: (day) {
                  // Return a list of events that occur on the specified day
                  return events
                      .where((event) => isSameDay(event.date, day))
                      .toList();
                },
                calendarFormat: _calendarFormat,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDate = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    headerMargin: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    titleTextStyle: Styles.white16(),
                    leftChevronIcon: SvgPicture.asset(AssetImages.whiteBack),
                    rightChevronIcon: SvgPicture.asset(AssetImages.whiteNext),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10))),
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  selectedDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColors.yellowColor,
                  ),
                  todayTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  markerDecoration: BoxDecoration(
                      color: AppColors.yellowColor, shape: BoxShape.rectangle),
                  markersMaxCount: 4,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Obx(
                () => role.value == 'expert'
                    ? GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteName.addEventPage);
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            AppStrings.addEvent.tr,
                            style: Styles.primary12UText(),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildTimeSlots(events, _selectedDate),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class Event {
  final DateTime date;
  final String title;
  final String? subTitle;
  final String? location;
  final String? time;

  Event(
      {required this.date,
      required this.title,
      this.subTitle,
      this.location,
      this.time});
}

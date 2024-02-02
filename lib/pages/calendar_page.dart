import 'package:dogapp/components/event_item.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<String> eventsList = [
    '10 am - 11 am: Dog\'s Race, Friendly Match',
    '12 pm: Lunch with John',
  ];
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  List<Event> events = [];

  void _addSampleEvents() {
    events.add(
      Event(
          date: DateTime.now(),
          title: 'Sample Event',
          time: '10 - 11',
          subTitle: 'Test event',
          location: 'Germany'),
    );
    events.add(Event(
        date: DateTime.utc(2024, 2, 1),
        title: 'Sample Event',
        subTitle: 'Test event',
        location: 'Germany',
        time: '12 - 13')); // Add time for this event
    events.add(Event(
        date: DateTime.utc(2024, 2, 2),
        title: 'Sample Event',
        subTitle: 'Test event',
        location: 'Germany',
        time: '14 - 15')); // Add time for this event
    events.add(Event(
        date: DateTime.utc(2024, 2, 3),
        title: 'Sample Event',
        subTitle: 'Test event',
        location: 'Germany',
        time: '16 - 17')); // Add time for this event
    events.add(Event(
        date: DateTime.utc(2024, 2, 4),
        title: 'Sample Event',
        subTitle: 'Test event',
        location: 'Germany',
        time: '18 - 19')); // Add time for this event
  }

  // Widget buildTimeSlots(List<String> eventsList) {
  //   List<Widget> timeSlots = [];

  //   for (int index = 0; index < 24; index++) {
  //     String hour = (index).toString().padLeft(2, '0');
  //     String eventsForHour = '';

  //     for (String event in eventsList) {
  //       if (event.startsWith('$hour ')) {
  //         eventsForHour += '$event\n';
  //       }
  //     }

  //     // Check if eventsForHour is not empty and it starts with the hour
  //     if (eventsForHour.isNotEmpty && eventsForHour.startsWith('$hour ')) {
  //       timeSlots.add(
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               '$hour:00',
  //               style: Styles.black14(),
  //             ),
  //             const Divider(),
  //             const SizedBox(height: 8),
  //             const EventItem(
  //                 title: "Dog's Race",
  //                 subTitle: "Friendly Match",
  //                 location: "Location: Birmingham",
  //                 time: "10 am - 11 am"),
  //           ],
  //         ),
  //       );
  //     } else {
  //       timeSlots.add(
  //         Container(
  //           margin: const EdgeInsets.symmetric(vertical: 8),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 '$hour:00',
  //                 style: Styles.black14(),
  //               ),
  //               const Divider(),
  //               const SizedBox(height: 8),
  //             ],
  //           ),
  //         ),
  //       );
  //     }
  //   }

  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: timeSlots,
  //   );
  // }

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
                AppStrings.eventCalendar,
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

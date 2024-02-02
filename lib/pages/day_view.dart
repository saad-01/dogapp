import 'package:flutter/material.dart';

class DayView extends StatefulWidget {
  final DateTime? date;

  DayView({this.date});

  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  List<String> events = [
    '10 am - 11 am: Dog\'s Race, Friendly Match',
    '12 pm: Lunch with John',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Day View'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 24,
              itemBuilder: (context, index) {
                String hour = (index + 1).toString().padLeft(2, '0');
                String eventsForHour = '';

                for (String event in events) {
                  if (event.startsWith('$hour ')) {
                    eventsForHour += '$event\n';
                  }
                }

                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$hour:00',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        eventsForHour,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

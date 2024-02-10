import 'package:flutter/material.dart';

class DayView extends StatefulWidget {
  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  double _distance = 0.0;
  int _steps = 0;

  @override
  void initState() {
    super.initState();
      }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Step Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Steps: $_steps',
                style: TextStyle(fontSize: 24.0),
              ),
              Text(
                'Distance: $_distance meters',
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

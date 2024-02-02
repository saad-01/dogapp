import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

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
    accelerometerEventStream().listen((AccelerometerEvent event) {
      // Assuming Z-axis acceleration represents vertical motion
      double verticalAcceleration = event.z;

      // Assuming a threshold for detecting a step
      if (verticalAcceleration > 10.0) {
        setState(() {
          _steps++;
        });
      }

      // Update distance based on step count and average stride length
      // Adjust these values based on your requirements and user characteristics
      double averageStrideLengthMeters = 0.7;
      double distance = _steps * averageStrideLengthMeters;

      setState(() {
        _distance = distance;
      });
    });
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

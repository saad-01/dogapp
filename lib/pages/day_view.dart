import 'package:flutter/material.dart';

class DayView extends StatefulWidget {
  const DayView({super.key});

  @override
  _DayViewState createState() => _DayViewState();
}

class _DayViewState extends State<DayView> {
  final double _distance = 0.0;
  final int _steps = 0;

  @override
  void initState() {
    super.initState();
      }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Step Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Steps: $_steps',
                style: const TextStyle(fontSize: 24.0),
              ),
              Text(
                'Distance: $_distance meters',
                style: const TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

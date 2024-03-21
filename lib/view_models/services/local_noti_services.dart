import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static void initialize(BuildContext context) {
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'));
    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  static void display(RemoteMessage message) {
    const NotificationDetails details = NotificationDetails(
        android: AndroidNotificationDetails(
      "easyApproach",
      "easyApproach channel",
      importance: Importance.max,
      priority: Priority.high,
    ));
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    _flutterLocalNotificationsPlugin.show(
        id, message.notification!.title, message.notification!.body, details,
        payload: message.data['route']);
  }
}

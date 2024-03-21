import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatModel extends GetxController {
  ScrollController scrollController = ScrollController();
  TextEditingController sendMessageController = TextEditingController();
  TextStyle? messageTextStyle=const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);


  sendNotification(String token, String? msg, String name) async {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'key=AAAAgYJteF0:APA91bFvTR-M__u9GX-ApSPcie4GIHpKOhQ1H18KYQrRvEaKL7RVlXkfPtPUjeKjC754qG7dt8iGi0MF8SPp4GfQ8Vh_1d1R1pKa0J8HXzkTtO89CIebnr9hae1zhdRIwBXJPdWrMGXD',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': '$msg',
            'title': 'Message from ${name.toUpperCase()}'
          },
          'priority': 'high',
          'data': <String, dynamic>{},
          'to': token
        },
      ),
    );
  }
}

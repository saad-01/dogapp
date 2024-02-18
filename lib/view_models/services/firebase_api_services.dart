import 'dart:convert';

import 'package:http/http.dart' as http;

class FirebaseAPIServices {
  final String key="AAAAgYJteF0:APA91bFvTR-M__u9GX-ApSPcie4GIHpKOhQ1H18KYQrRvEaKL7RVlXkfPtPUjeKjC754qG7dt8iGi0MF8SPp4GfQ8Vh_1d1R1pKa0J8HXzkTtO89CIebnr9hae1zhdRIwBXJPdWrMGXD";
  sendPushNotifications({required String title,
    required String body,
    required List<String> token,}) async {
    const String apiUrl = 'https://fcm.googleapis.com/fcm/send';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$key',
    };

    final Map<String, dynamic> data = {
      'priority': 'high',
      'data': <String, dynamic>{
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'status': 'done',
        'title': title,
        'body': body
      },
      'notification': <String, dynamic>{
        'title': title,
        'body': body,
        'android_channel_id': 'poolyfi'
      },
      'registration_ids': token
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        // The request was successful, and you can parse the response data.
        print('Response data: ${response.body}');
      }
    } catch (e) {
      // Handle network and other errors here.
      print('Error: $e');
    }
  }
}
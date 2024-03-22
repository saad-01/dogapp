import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/chat_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityModel extends GetxController {
  List<String> userIds = [];
  List<Widget> userWidgets = [];
  Future<List<String>> getUsersWithChats() async {
    String currentUserId = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot senderChats = await FirebaseFirestore.instance
        .collection('messages')
        .where('sender_id', isEqualTo: currentUserId)
        .get();

    QuerySnapshot receiverChats = await FirebaseFirestore.instance
        .collection('messages')
        .where('receiver_id', isEqualTo: currentUserId)
        .get();

    for (var doc in senderChats.docs) {
      String receiverId = doc['receiver_id'];
      if (!userIds.contains(receiverId)) {
        userIds.add(receiverId);
      }
    }

    for (var doc in receiverChats.docs) {
      String senderId = doc['sender_id'];
      if (!userIds.contains(senderId)) {
        userIds.add(senderId);
      }
    }

    await getUserWidgets();
    return userIds;
  }

  Future<List<Widget>> getUserWidgets() async {
    // Iterate through each user ID in the list
    for (String userId in userIds) {
      // Query Firestore to get the user document with the current user ID
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      // Check if the document exists and contains data
      if (userSnapshot.exists) {
        // Get the 'name' field from the user document
        String userName = userSnapshot.get('name');
        String image = userSnapshot.get('photoUrl');
        // Create a Text widget with the user's name
        Widget userWidget = ChatItem(
          name: userName,
          arguments: userSnapshot,
          image: image,
        );
        // Add the Text widget to the list of user widgets

        userWidgets.add(userWidget);
      }
    }

    return userWidgets;
  }
}

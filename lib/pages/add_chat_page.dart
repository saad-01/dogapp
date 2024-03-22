import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/new_chat_item.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/view_models/services/shared_prefence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';

class AddChatPage extends StatefulWidget {
  const AddChatPage({super.key});

  @override
  State<AddChatPage> createState() => _AddChatPageState();
}

class _AddChatPageState extends State<AddChatPage> {
  SharedPref pref = SharedPref();
  RxString role = ''.obs;
  Future<void> getRole() async {
    role.value = (await pref.getRoleFromSharedPreferences())!;
  }

  @override
  void initState() {
    getRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.chats),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: role.value == 'parent'
                          ? FirebaseFirestore.instance
                              .collection('users')
                              .where('uid',
                                  isNotEqualTo:
                                      FirebaseAuth.instance.currentUser!.uid)
                              .where('role', isEqualTo: 'expert')
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection('users')
                              .where('uid',
                                  isNotEqualTo:
                                      FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // While data is being fetched, show a loading indicator
                          return const CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          );
                        } else if (snapshot.hasError) {
                          // If an error occurs during data retrieval, display an error message
                          return Text('Error: ${snapshot.error}');
                        } else {
                          if (snapshot.data!.docs.isEmpty) {
                            return Text(
                              AppStrings.none.tr,
                              style: Styles.grey16(),
                            );
                          } else {
                            return Column(
                              children: List.generate(
                                  snapshot.data!.docs.length, (index) {
                                return Column(
                                  children: [
                                    NewChatItem(
                                      name:
                                          '${snapshot.data!.docs[index].get('name')}',
                                      image:
                                          '${snapshot.data!.docs[index].get('photoUrl')}',
                                      details: snapshot.data!.docs[index],
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                  ],
                                );
                              }),
                            );
                          }
                        }
                      }),
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}


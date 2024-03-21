import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/recieved_msg.dart';
import 'package:dogapp/components/sender_msg.dart';
import 'package:dogapp/view_models/chat_model.dart';
import 'package:dogapp/view_models/services/shared_prefence.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final doc = Get.arguments;
  final chatVM = Get.put(ChatModel());
  bool showSender = false;
  SharedPref pref = SharedPref();
  RxString name = ''.obs;
  Future<void> getName() async {
    name.value = (await pref.getNameFromSharedPreferences())!;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      chatVM.sendMessageController.clear();
      Future.delayed(const Duration(seconds: 1))
          .whenComplete(() => chatVM.scrollController.animateTo(
                chatVM.scrollController.position.maxScrollExtent,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 100),
              ));
    });
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadedSlideAnimation(
        beginOffset: const Offset(0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 61),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: FadedScaleAnimation(
                    fadeDuration: const Duration(milliseconds: 400),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('messages')
                            .orderBy('time')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.docs.isEmpty) {
                              return Center(
                                child: Text(
                                  'Record not found!',
                                  textAlign: TextAlign.center,
                                ),
                              );
                            } else {
                              return SingleChildScrollView(
                                  controller: chatVM.scrollController,
                                  child: Wrap(
                                    children: List.generate(
                                        snapshot.data!.docs.length,
                                        (innerIndex) {
                                      if ((snapshot.data!.docs[innerIndex]
                                                      .get('sender_id')
                                                      .toString() ==
                                                  FirebaseAuth
                                                      .instance.currentUser!.uid
                                                      .toString() &&
                                              snapshot.data!.docs[innerIndex]
                                                      .get('receiver_id')
                                                      .toString() ==
                                                  doc!.get('uid').toString()) ||
                                          (snapshot.data!.docs[innerIndex]
                                                      .get('receiver_id')
                                                      .toString() ==
                                                  FirebaseAuth
                                                      .instance.currentUser!.uid
                                                      .toString() &&
                                              snapshot.data!.docs[innerIndex]
                                                      .get('sender_id')
                                                      .toString() ==
                                                  doc!.get('uid').toString())) {
                                        return Padding(
                                          padding: snapshot
                                                      .data!.docs[innerIndex]
                                                      .get('sender_id')
                                                      .toString() ==
                                                  FirebaseAuth
                                                      .instance.currentUser!.uid
                                                      .toString()
                                              ? const EdgeInsetsDirectional
                                                  .fromSTEB(80, 7, 15, 7)
                                              : const EdgeInsetsDirectional
                                                  .fromSTEB(15, 7, 80, 7),
                                          child: Row(
                                            mainAxisAlignment: snapshot
                                                        .data!.docs[innerIndex]
                                                        .get('sender_id')
                                                        .toString() ==
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid
                                                        .toString()
                                                ? MainAxisAlignment.end
                                                : MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: snapshot
                                                                .data!
                                                                .docs[
                                                                    innerIndex]
                                                                .get(
                                                                    'sender_id')
                                                                .toString() ==
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid
                                                                .toString()
                                                        ? Color(0xffFFA500)
                                                        : Color(0xffEFFAF4),
                                                    borderRadius: snapshot
                                                                .data!
                                                                .docs[
                                                                    innerIndex]
                                                                .get(
                                                                    'sender_id')
                                                                .toString() ==
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid
                                                                .toString()
                                                        ? const BorderRadius
                                                            .only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20),
                                                          )
                                                        : const BorderRadius
                                                            .only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20),
                                                          )),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .all(14.0),
                                                  child: Text(
                                                    '${snapshot.data!.docs[innerIndex].get('msg')}',
                                                    style: snapshot
                                                                .data!
                                                                .docs[
                                                                    innerIndex]
                                                                .get(
                                                                    'sender_id')
                                                                .toString() ==
                                                            FirebaseAuth
                                                                .instance
                                                                .currentUser!
                                                                .uid
                                                                .toString()
                                                        ? chatVM
                                                            .messageTextStyle
                                                        : chatVM
                                                            .messageTextStyle!
                                                            .copyWith(
                                                                color: Colors
                                                                    .black),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    }),
                                  ));
                            }
                          } else {
                            return Text(
                              'Record not found',
                              textAlign: TextAlign.center,
                            );
                          }
                        }),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextFormField(
                onTap: () {
                  chatVM.scrollController.animateTo(
                    chatVM.scrollController.position.maxScrollExtent,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 500),
                  );
                },
                controller: chatVM.sendMessageController,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      showSender = true;
                    });
                  } else {
                    setState(() {
                      showSender = false;
                    });
                  }
                },
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Write your message here...',
                    suffixIcon: !showSender
                        ? const SizedBox()
                        : InkWell(
                            onTap: () async {
                              String _friendsToken;
                              String _msg = '';
                              FirebaseFirestore.instance
                                  .collection('messages')
                                  .doc()
                                  .set({
                                'sender_id':
                                    FirebaseAuth.instance.currentUser!.uid,
                                'receiver_id': doc!.get('uid'),
                                'msg': chatVM.sendMessageController.text,
                                'time': DateTime.now()
                              });
                              _msg = chatVM.sendMessageController.text;
                              chatVM.sendMessageController.clear();
                              FirebaseFirestore.instance
                                  .collection('tokens')
                                  .where('uid', isEqualTo: doc!.get('uid'))
                                  .get()
                                  .then((value) {
                                _friendsToken = value.docs[0].data()['token'];
                                chatVM.sendNotification(
                                  _friendsToken,
                                  _msg,
                                  doc!.get('name'),
                                );
                              });
                            },
                            child: Icon(
                              Icons.send,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
          ],
        ),
      ),
      // body: SafeArea(
      //     child: Column(
      //   children: [
      //     Container(
      //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      //       // height: 130,
      //       decoration: ShapeDecoration(
      //         color: AppColors.white,
      //         shape: RoundedRectangleBorder(
      //           side: BorderSide(
      //             width: 0.50,
      //             color: Colors.black.withOpacity(0.11999999731779099),
      //           ),
      //           borderRadius: const BorderRadius.only(
      //             bottomLeft: Radius.circular(28),
      //             bottomRight: Radius.circular(28),
      //           ),
      //         ),
      //         shadows: const [
      //           BoxShadow(
      //             color: Color(0x14000000),
      //             blurRadius: 12,
      //             offset: Offset(0, 2),
      //             spreadRadius: 0,
      //           )
      //         ],
      //       ),
      //       child: Column(
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Row(
      //                 children: [
      //                   Material(
      //                     color: Colors.transparent,
      //                     child: InkWell(
      //                       borderRadius: BorderRadius.circular(9),
      //                       onTap: () {
      //                         Get.back();
      //                       },
      //                       child: Ink(
      //                         width: 59,
      //                         height: 40,
      //                         decoration: ShapeDecoration(
      //                           color: AppColors.primaryColor.withOpacity(0.20),
      //                           shape: RoundedRectangleBorder(
      //                               borderRadius: BorderRadius.circular(9)),
      //                           shadows: const [
      //                             BoxShadow(
      //                               color: Color(0x1E000000),
      //                               blurRadius: 8,
      //                               offset: Offset(0, 4),
      //                               spreadRadius: 0,
      //                             )
      //                           ],
      //                         ),
      //                         child: Center(
      //                           child: SvgPicture.asset(AssetImages.backIcon),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   const SizedBox(
      //                     width: 16,
      //                   ),
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         doc['name'],
      //                         style: Styles.appBarH1(),
      //                       ),
      //                       // Text(
      //                       //   'Last online: 2 min ago',
      //                       //   style: Styles.black10Sub(),
      //                       // ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //               Container(
      //                   width: 35,
      //                   height: 35,
      //                   decoration: BoxDecoration(
      //                       color: Colors.blueAccent,
      //                       borderRadius: BorderRadius.circular(
      //                           1000) // Set your desired color
      //                       ),
      //                   child: ClipOval(
      //                     child: Image.network(
      //                       doc['photoUrl'],
      //                       fit: BoxFit.cover,
      //                     ),
      //                   )),
      //             ],
      //           ),
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           SvgPicture.asset(AssetImages.horizontalDivider),
      //         ],
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 30,
      //     ),
      //     Expanded(
      //       flex: 15,
      //       child: SingleChildScrollView(
      //         child: Container(
      //           padding: const EdgeInsets.all(15),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               const SenderMsg(),
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //               const RecievedMsg(),
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //               Image.asset(AssetImages.demoImage),
      //               const SizedBox(
      //                 height: 5,
      //               ),
      //               Text(
      //                 '10:28 AM',
      //                 style: Styles.black10Sub(),
      //               ),
      //               const SizedBox(
      //                 height: 20,
      //               ),
      //               Image.asset(AssetImages.demoVideo),
      //               const SizedBox(
      //                 height: 5,
      //               ),
      //               Text(
      //                 '10:28 AM',
      //                 style: Styles.black10Sub(),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     const Spacer(
      //       flex: 1,
      //     ),
      //     Container(
      //       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      //       decoration: ShapeDecoration(
      //         color: AppColors.white,
      //         shape: RoundedRectangleBorder(
      //           side: BorderSide(
      //             width: 0.50,
      //             color: AppColors.black.withOpacity(0.11999999731779099),
      //           ),
      //           borderRadius: const BorderRadius.only(
      //             topLeft: Radius.circular(16),
      //             topRight: Radius.circular(16),
      //           ),
      //         ),
      //         shadows: const [
      //           BoxShadow(
      //             color: Color(0x14000000),
      //             blurRadius: 12,
      //             offset: Offset(0, 2),
      //             spreadRadius: 0,
      //           )
      //         ],
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: [
      //           Expanded(
      //             child: Container(
      //               width: MediaQuery.sizeOf(context).width,
      //               // height: 48,
      //               padding:
      //                   const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      //               decoration: ShapeDecoration(
      //                 color: AppColors.white,
      //                 shape: RoundedRectangleBorder(
      //                   side: BorderSide(
      //                     width: 0.10,
      //                     color:
      //                         AppColors.black.withOpacity(0.6100000143051147),
      //                   ),
      //                   borderRadius: BorderRadius.circular(8),
      //                 ),
      //                 shadows: const [
      //                   BoxShadow(
      //                     color: Color(0x0F000000),
      //                     blurRadius: 8,
      //                     offset: Offset(0, 2),
      //                     spreadRadius: 0,
      //                   )
      //                 ],
      //               ),
      //               child: Column(
      //                 children: [
      //                   Row(
      //                     children: [
      //                       SvgPicture.asset(AssetImages.emoji),
      //                       const SizedBox(
      //                         width: 20,
      //                       ),
      //                       Expanded(
      //                           child: TextField(
      //                         decoration: InputDecoration(
      //                             border: InputBorder.none,
      //                             hintText: AppStrings.connectExperts.tr,
      //                             hintStyle: const TextStyle(
      //                               color: Color(0x420A0A0A),
      //                               fontSize: 14,
      //                               fontWeight: FontWeight.w400,
      //                             )),
      //                       )),
      //                       const SizedBox(
      //                         width: 20,
      //                       ),
      //                       SvgPicture.asset(AssetImages.attach),
      //                       const SizedBox(
      //                         width: 10,
      //                       ),
      //                       SvgPicture.asset(AssetImages.primaryCam),
      //                     ],
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //           SvgPicture.asset(AssetImages.sendBtn),
      //         ],
      //       ),
      //     ),
      //   ],
      // )),
    );
  }
}

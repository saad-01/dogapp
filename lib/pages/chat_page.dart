import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/recieved_msg.dart';
import 'package:dogapp/components/sender_msg.dart';
import 'package:dogapp/view_models/chat_model.dart';
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
  RxBool showSender = false.obs;

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FadedSlideAnimation(
          beginOffset: const Offset(0, 0.3),
          endOffset: const Offset(0, 0),
          slideCurve: Curves.linearToEaseOut,
          child: Stack(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                // height: 130,
                decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      color: Colors.black.withOpacity(0.11999999731779099),
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 12,
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(9),
                                onTap: () {
                                  Get.back();
                                },
                                child: Ink(
                                  width: 59,
                                  height: 40,
                                  decoration: ShapeDecoration(
                                    color: AppColors.primaryColor
                                        .withOpacity(0.20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(9)),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x1E000000),
                                        blurRadius: 8,
                                        offset: Offset(0, 4),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Center(
                                    child:
                                        SvgPicture.asset(AssetImages.backIcon),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doc['name'],
                                  style: Styles.appBarH1(),
                                ),
                                // Text(
                                //   'Last online: 2 min ago',
                                //   style: Styles.black10Sub(),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(
                                    1000) // Set your desired color
                                ),
                            child: ClipOval(
                              child: Image.network(
                                doc['photoUrl'],
                                fit: BoxFit.cover,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SvgPicture.asset(AssetImages.horizontalDivider),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom > 0
                        ? MediaQuery.of(context).size.height * 0.5
                        : MediaQuery.of(context).size.height * 0.80,
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
                                    AppStrings.none.tr,
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
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid
                                                        .toString() &&
                                                snapshot.data!.docs[innerIndex]
                                                        .get('receiver_id')
                                                        .toString() ==
                                                    doc!
                                                        .get('uid')
                                                        .toString()) ||
                                            (snapshot.data!.docs[innerIndex]
                                                        .get('receiver_id')
                                                        .toString() ==
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid
                                                        .toString() &&
                                                snapshot.data!.docs[innerIndex]
                                                        .get('sender_id')
                                                        .toString() ==
                                                    doc!
                                                        .get('uid')
                                                        .toString())) {
                                          return Padding(
                                            padding: snapshot
                                                        .data!.docs[innerIndex]
                                                        .get('sender_id')
                                                        .toString() ==
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid
                                                        .toString()
                                                ? const EdgeInsetsDirectional
                                                    .fromSTEB(80, 7, 15, 7)
                                                : const EdgeInsetsDirectional
                                                    .fromSTEB(15, 7, 80, 7),
                                            child: Row(
                                              mainAxisAlignment: snapshot.data!
                                                          .docs[innerIndex]
                                                          .get('sender_id')
                                                          .toString() ==
                                                      FirebaseAuth.instance
                                                          .currentUser!.uid
                                                          .toString()
                                                  ? MainAxisAlignment.end
                                                  : MainAxisAlignment.start,
                                              children: [
                                                snapshot.data!.docs[innerIndex]
                                                            .get('sender_id')
                                                            .toString() ==
                                                        FirebaseAuth.instance
                                                            .currentUser!.uid
                                                            .toString()
                                                    ? SenderMsg(
                                                        msg:
                                                            '${snapshot.data!.docs[innerIndex].get('msg')}')
                                                    : RecievedMsg(
                                                        msg:
                                                            '${snapshot.data!.docs[innerIndex].get('msg')}'),
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
                                AppStrings.none.tr,
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
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: ShapeDecoration(
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 0.50,
                        color: AppColors.black.withOpacity(0.11999999731779099),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 12,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          // height: 48,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 2),
                          decoration: ShapeDecoration(
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 0.10,
                                color: AppColors.black
                                    .withOpacity(0.6100000143051147),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x0F000000),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(AssetImages.emoji),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: TextField(
                                onTap: () {
                                  chatVM.scrollController.animateTo(
                                    chatVM.scrollController.position
                                        .maxScrollExtent,
                                    curve: Curves.easeOut,
                                    duration: const Duration(milliseconds: 500),
                                  );
                                },
                                controller: chatVM.sendMessageController,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    showSender.value = true;
                                  } else {
                                    showSender.value = false;
                                  }
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: AppStrings.connectExperts.tr,
                                    hintStyle: const TextStyle(
                                      color: Color(0x420A0A0A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    )),
                              )),
                              const SizedBox(
                                width: 20,
                              ),
                              SvgPicture.asset(AssetImages.attach),
                              const SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(AssetImages.primaryCam),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => showSender.value
                            ? GestureDetector(
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
                                  showSender.value = false;
                                  FirebaseFirestore.instance
                                      .collection('tokens')
                                      .where('uid', isEqualTo: doc!.get('uid'))
                                      .get()
                                      .then((value) {
                                    _friendsToken =
                                        value.docs[0].data()['token'];
                                    chatVM.sendNotification(
                                      _friendsToken,
                                      _msg,
                                      doc!.get('name'),
                                    );
                                  });
                                },
                                child: SvgPicture.asset(AssetImages.sendBtn))
                            : const SizedBox(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

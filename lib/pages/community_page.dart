import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/comm_msg.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/view_models/community_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/image_box.dart';
import '../utils/app_colors.dart';
import '../utils/styles.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  RxInt index = 0.obs;
  late TabController _tabController;
  final vm = Get.put(CommunityModel());
  @override
  void initState() {
    vm.getUsersWithChats();
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    // This callback will be called whenever the tab changes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Code inside this callback will run after the frame is built
      index.value = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: CustomAppBar(title: AppStrings.community.tr),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      color: AppColors.black.withOpacity(0.11999999731779099),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x1E000000),
                      blurRadius: 8,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Obx(
                  () => TabBar(
                    controller: _tabController,
                    unselectedLabelColor: AppColors.black,
                    labelColor: AppColors.white,
                    unselectedLabelStyle: Styles.expertSignupPaget1(),
                    labelStyle: Styles.white16UTxt(),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    indicatorColor: AppColors.primaryColor,
                    splashBorderRadius: BorderRadius.circular(10),
                    onTap: (value) {
                      index.value = value;
                    },
                    tabs: <Widget>[
                      Tab(
                        icon: index.value == 0
                            ? SvgPicture.asset(AssetImages.whiteComm)
                            : SvgPicture.asset(AssetImages.blackComm),
                      ),
                      Tab(
                        text: AppStrings.chats.tr,
                      ),
                      Tab(
                        text: AppStrings.groups.tr,
                      ),
                    ],
                  ),
                )),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              Center(
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: SingleChildScrollView(
                        child: Container(
                          // height: MediaQuery.sizeOf(context).height * ,
                          padding: const EdgeInsets.all(20.0),
                          child: const Column(
                            children: [
                              CommunityMsgItem(),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      decoration: ShapeDecoration(
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            color: AppColors.black
                                .withOpacity(0.11999999731779099),
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
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(AssetImages.emoji),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                          child: TextField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                AppStrings.connectExperts.tr,
                                            hintStyle: const TextStyle(
                                              color: Color(0x420A0A0A),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      )),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      SvgPicture.asset(AssetImages.primaryCam)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SvgPicture.asset(AssetImages.sendBtn),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 35,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    AppStrings.chats.tr,
                                    style: Styles.appBarH1(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: vm.userWidgets,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    PrimartyButton(
                        title: AppStrings.addChat.tr,
                        width: 260,
                        height: 12,
                        onTap: () {
                          Get.toNamed(RouteName.addChatPage);
                        },
                        icon: AssetImages.addWhiteIcon),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Text(
                      AppStrings.newGroups.tr.toUpperCase(),
                      style: Styles.black28(),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        AppStrings.addNewGrps.tr.toUpperCase(),
                        style: Styles.lightGrey12(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageBox(
                          imagePath: AssetImages.died,
                          onPress: () {},
                          title: AppStrings.findGroup.tr,
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        ImageBox(
                          imagePath: AssetImages.otherReason,
                          onPress: () {
                            // Get.toNamed(RouteName.missReportPage);
                          },
                          title: AppStrings.createGroup.tr,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      )),
    );
  }
}

import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:flutter/material.dart';
import 'package:dogapp/components/expertDashboard_btn.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';

class FileDetailsPage extends StatelessWidget {
  FileDetailsPage({super.key});
  final String status = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CustomAppBar(title: "Dain's File"),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: ShapeDecoration(
                  color: const Color(0xfffafbfb),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      color: Colors.black.withOpacity(0.11999999731779099),
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
                child: TabBar(
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
                  tabs: const <Widget>[
                    Tab(
                      text: AppStrings.detail,
                    ),
                    Tab(
                      text: AppStrings.profile,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 58.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: ShapeDecoration(
                                      color: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.50,
                                          color: Colors.black
                                              .withOpacity(0.11999999731779099),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              status == 'Approved'
                                                  ? AppStrings.approved
                                                  : status == 'Completed'
                                                      ? AppStrings.completed
                                                      : '',
                                              style: Styles.primary16U(),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 110.0),
                                          child: Divider(
                                            color: Color(0xFFA8A8A8),
                                          ),
                                        ),
                                        Text(
                                          "Affenpinscher",
                                          style: Styles.expertSignupPaget1(),
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${AppStrings.appointType}:',
                                                style: Styles.grey14()),
                                            Text(
                                              AppStrings.vaccination,
                                              style: Styles.black14(),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${AppStrings.pet}:',
                                                style: Styles.grey14()),
                                            Text(
                                              AppStrings.dogNameH,
                                              style: Styles.black14(),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('${AppStrings.date}:',
                                                style: Styles.grey14()),
                                            Text(
                                              AppStrings.dateFormat,
                                              style: Styles.black14(),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        Row(
                                          children: [
                                            Text('${AppStrings.notes}:',
                                                style: Styles.grey14()),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                AppStrings.note,
                                                style: Styles.choosePageText(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    left: 0,
                                    child: SvgPicture.asset(
                                        AssetImages.injectionLg))
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            if (status == 'Requested')
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ExpertDashboardBtn(
                                    title: AppStrings.reject,
                                    borderClr: AppColors.redShade,
                                    height: 53,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    bgClr: const Color(0xfff8eeed),
                                    clr: AppColors.maroonColor,
                                  ),
                                  ExpertDashboardBtn(
                                    title: AppStrings.approve,
                                    borderClr: AppColors.primaryColor,
                                    height: 53,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    bgClr: const Color(0xFFecf9f6),
                                    clr: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                            if (status == 'Approved')
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ExpertDashboardBtn(
                                    title: AppStrings.completed,
                                    borderClr: AppColors.primaryColor,
                                    height: 53,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.88,
                                    leading: AssetImages.thumbsUpIcon,
                                    trailing: AssetImages.nextPrimaryIcon,
                                    bgClr: const Color(0xFFecf9f6),
                                    clr: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                            if (status == 'Completed') ...[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ExpertDashboardBtn(
                                    title: AppStrings.completed,
                                    borderClr: AppColors.primaryColor,
                                    height: 53,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.88,
                                    leading: AssetImages.thumbsUpFilled,
                                    trailing: AssetImages.nextPrimaryIcon,
                                    bgClr: const Color(0xFFecf9f6),
                                    clr: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(RouteName.vaccinationReportPage);
                                },
                                child: Ink(
                                  padding: const EdgeInsets.all(20),
                                  decoration: ShapeDecoration(
                                    color: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.50,
                                        color: Colors.black
                                            .withOpacity(0.11999999731779099),
                                      ),
                                      borderRadius: BorderRadius.circular(6),
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
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppStrings.createFile,
                                              style:
                                                  Styles.expertSignupPaget1(),
                                            ),
                                            Text(
                                              AppStrings.informParent,
                                              style: Styles.choosePageText(),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      SvgPicture.asset(AssetImages.createFile),
                                    ],
                                  ),
                                ),
                              )
                            ]
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 70),
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 15,
                                        right: 15,
                                        bottom: 25),
                                    decoration: ShapeDecoration(
                                      color: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 0.50,
                                          color: Colors.black
                                              .withOpacity(0.11999999731779099),
                                        ),
                                        borderRadius: BorderRadius.circular(10),
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
                                        Column(
                                          children: [
                                            const SizedBox(
                                              height: 100,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('${AppStrings.dogName}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  AppStrings.dogNameH,
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('${AppStrings.breed}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  AppStrings.breed,
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    '${AppStrings.dateOfBirth}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  AppStrings.dateFormat,
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('${AppStrings.gender}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  AppStrings.gender,
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('${AppStrings.weight}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  AppStrings.weight,
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                    '${AppStrings.microChipNum}:',
                                                    style: Styles.grey14()),
                                                Text(
                                                  AppStrings.microChipNum,
                                                  style: Styles.black14(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                    left: 115,
                                    top: 0,
                                    child: Container(
                                      width: 116,
                                      height: 116,
                                      decoration: ShapeDecoration(
                                        image: const DecorationImage(
                                          image:
                                              AssetImage(AssetImages.dogItem),
                                          fit: BoxFit.cover,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                              width: 1.50,
                                              color: AppColors.primaryColor),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              PrimartyButton(
                  title: AppStrings.addComment,
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  height: 10,
                  onTap: () {
                    Get.toNamed(RouteName.addCommentsPage);
                  },
                  icon: AssetImages.addWhiteIcon)
            ],
          ),
        )),
      ),
    );
  }
}

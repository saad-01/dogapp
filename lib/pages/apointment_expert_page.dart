import 'package:dogapp/components/expertDashboard_btn.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/appbar.dart';
import '../utils/app_colors.dart';
import '../utils/assets.dart';

class AppointmentExpertPage extends StatelessWidget {
  AppointmentExpertPage({super.key});
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
              const CustomAppBar(title: AppStrings.appointDetail),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: ShapeDecoration(
                  color: const Color(0x38ECECEC),
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
                            // if (status == 'Approved')
                            //   Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     children: [
                            //       ExpertDashboardBtn(
                            //         title: AppStrings.completed,
                            //         borderClr: AppColors.primaryColor,
                            //         height: 53,
                            //         width:
                            //             MediaQuery.sizeOf(context).width * 0.88,
                            //         leading: AssetImages.thumbsUpIcon,
                            //         trailing: AssetImages.nextPrimaryIcon,
                            //         bgClr: const Color(0xFFecf9f6),
                            //         clr: AppColors.primaryColor,
                            //       ),
                            //     ],
                            //   ),
                            if (status == 'Approved') ...[
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
                              Ink(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            style: Styles.expertSignupPaget1(),
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
                              )
                            ]
                          ],
                        ),
                      ),
                    ),
                    const SingleChildScrollView(
                      child: Center(
                        child: Column(
                          children: [],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

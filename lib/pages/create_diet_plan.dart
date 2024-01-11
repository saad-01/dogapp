import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/select_field.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/textfield.dart';
import '../utils/styles.dart';

class CreateDietPlan extends StatelessWidget {
  const CreateDietPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.createPlan),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.planTitle,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomTextfield(
                    hintText: AppStrings.givePlanTitle,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.notes,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomTextfield(
                    hintText: AppStrings.typeNotes,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.startDate,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomTextfield(
                    hintText: AppStrings.dateFormat,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.endDate,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomTextfield(
                    hintText: AppStrings.dateFormat,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.category,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SelectTextfield(
                    hintText: 'Diet Plan',
                    items: [],
                    val: '',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.createTimeTable,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.createDetailedTb,
                      style: Styles.lightGrey12(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(RouteName.dietPlanPage);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 18),
                      height: 101,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFFF9F2),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.50,
                            color:
                                Colors.black.withOpacity(0.11999999731779099),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(AssetImages.timeTable),
                          Text(
                            AppStrings.createTimeTable,
                            style: Styles.expertSignupPaget1(),
                          ),
                          SvgPicture.asset(AssetImages.nextBlackIcon),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFF018383),
                              ),
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        AppStrings.sendNoti,
                        style: Styles.expertSignupPaget1(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimartyButton(
                      title: AppStrings.share,
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      height: 10,
                      icon: '')
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}

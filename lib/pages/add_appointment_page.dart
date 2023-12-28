import 'package:dogapp/components/svg_box.dart';
import 'package:dogapp/routes/route_names.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../components/appbar.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';

class AddAppointmentPage extends StatelessWidget {
  const AddAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const CustomAppBar(
              title: AppStrings.appAppoint,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgBox(
                        imagePath: AssetImages.injectionImage,
                        onPress: () {},
                        title: AppStrings.vaccination,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SvgBox(
                        imagePath: AssetImages.antiParasite,
                        onPress: () {},
                        title: AppStrings.antiparasitic,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgBox(
                        imagePath: AssetImages.medImage,
                        onPress: () {},
                        title: AppStrings.medicine,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SvgBox(
                        imagePath: AssetImages.symptoms,
                        onPress: () {},
                        title: AppStrings.symptoms,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgBox(
                        imagePath: AssetImages.vetImage,
                        onPress: () {},
                        title: AppStrings.vetVisit,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SvgBox(
                        imagePath: AssetImages.boneMeal,
                        onPress: () {},
                        title: AppStrings.otherExpert,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.84,
                    decoration: ShapeDecoration(
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0x1E010101)),
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
                    child: ListTile(
                      leading: SvgPicture.asset(AssetImages.coloredFile),
                      trailing: SvgPicture.asset(AssetImages.nextPrimaryIcon),
                      title: Text(
                        AppStrings.patientFiles,
                        style: Styles.choosePageText(),
                      ),
                      subtitle: Text(
                        AppStrings.seeAllFiles,
                        style: Styles.lightgrey8(),
                      ),
                      onTap: () {
                        Get.toNamed(RouteName.patientFilesPage);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ))
          ],
        ),
      )),
    );
  }
}

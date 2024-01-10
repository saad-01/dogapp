import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppointmentDetailPage extends StatelessWidget {
  const AppointmentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.appointDetail),
            const SizedBox(
              height: 20,
            ),
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
                          color: Colors.black.withOpacity(0.11999999731779099),
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              AppStrings.edit,
                              style: Styles.primary16U(),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 110.0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${AppStrings.pet}:', style: Styles.grey14()),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${AppStrings.date}:', style: Styles.grey14()),
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
                        const SizedBox(
                          height: 5,
                        ),
                        const StatusItem(
                            title: AppStrings.approved, approval: true)
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: SvgPicture.asset(AssetImages.injectionLg))
              ],
            ),
          
          ],
        ),
      )),
    );
  }
}

class StatusItem extends StatelessWidget {
  const StatusItem(
      {super.key, this.color, required this.title, required this.approval});
  final Color? color;
  final String title;
  final bool approval;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 101,
      height: 28,
      decoration: ShapeDecoration(
        color: approval ? AppColors.statusBg1 : AppColors.statusBg2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      ),
      child: Center(
          child: Text(
        title,
        style: approval ? Styles.primary12UText() : Styles.denialTxt(),
      )),
    );
  }
}

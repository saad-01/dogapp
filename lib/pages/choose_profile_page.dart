import 'package:dogapp/components/not_outlined_box.dart';
import 'package:dogapp/components/outlined_box.dart';
import 'package:dogapp/components/primary_box.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';

class ChooseProfilePage extends StatefulWidget {
  const ChooseProfilePage({super.key});

  @override
  State<ChooseProfilePage> createState() => _ChooseProfilePageState();
}

class _ChooseProfilePageState extends State<ChooseProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PrimaryBox(imagePath: AssetImages.dog),
          const SizedBox(
            height: 20,
          ),
          Text(
            AppStrings.choosePageHeading,
            style: Styles.choosePageHeading(),
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const OutlinedBox(imagePath: AssetImages.parent),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppStrings.dogsParent,
                    style: Styles.choosePageText(),
                  )
                ],
              ),
              const SizedBox(
                width: 40,
              ),
              Column(
                children: [
                  const NotOutlinedBox(imagePath: AssetImages.expert),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppStrings.dogsExpert,
                    style: Styles.choosePageText(),
                  )
                ],
              ),
            ],
          )
        ],
      )),
    );
  }
}

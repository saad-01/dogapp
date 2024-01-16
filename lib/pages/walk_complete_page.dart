import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';

import '../components/select_field.dart';
import '../components/textfield.dart';
import '../utils/styles.dart';

class WalkCompletePage extends StatelessWidget {
  const WalkCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CustomAppBar(title: AppStrings.walkComplete),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.weather,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SelectTextfield(
                    val: 'Warm',
                    hintText: '',
                    items: [
                      DropdownMenuItem(value: 'Warm', child: Text('Warm')),
                      DropdownMenuItem(value: 'Once', child: Text('Once')),
                      DropdownMenuItem(
                          value: 'After two days',
                          child: Text('After two days')),
                      DropdownMenuItem(
                          value: 'Mon to Fri', child: Text('Mon to Fri')),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.walkingTrack,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SelectTextfield(
                    val: 'Forest',
                    hintText: '',
                    items: [
                      DropdownMenuItem(value: 'Forest', child: Text('Forest')),
                      DropdownMenuItem(value: 'Once', child: Text('Once')),
                      DropdownMenuItem(
                          value: 'After two days',
                          child: Text('After two days')),
                      DropdownMenuItem(
                          value: 'Mon to Fri', child: Text('Mon to Fri')),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.dogCondition,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomTextfield(hintText: '', obscureText: false),
                  const SizedBox(
                    height: 18,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.comment,
                      style: Styles.expertSignupPaget1(),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomTextfield(hintText: '', obscureText: false),
                  const Spacer(),
                  PrimartyButton(
                      title: AppStrings.save, width: 260, height: 12, icon: ''),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

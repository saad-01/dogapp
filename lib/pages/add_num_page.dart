import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/components/primary_btn.dart';
import 'package:dogapp/components/textfield.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:dogapp/utils/utils.dart';
import 'package:dogapp/view_models/add_num_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNumPage extends StatelessWidget {
  const AddNumPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addNumVM = Get.put(AddNumModel());
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.addNum),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                AppStrings.name,
                style: Styles.expertSignupPaget1(),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Form(
                key: formkey,
                child: Column(
                  children: [
                    CustomTextfield(
                        controller: addNumVM.nameController.value,
                        focusNode: addNumVM.nameFocusNode.value,
                        onFieldSubmitted: (p0) {
                          Utils.fieldFocusChange(
                              context,
                              addNumVM.nameFocusNode.value,
                              addNumVM.phoneNumFocusNode.value);
                        },
                        hintText: AppStrings.typeName,
                        obscureText: false),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.yourNumber,
                        style: Styles.expertSignupPaget1(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextfield(
                        controller: addNumVM.phoneNumController.value,
                        focusNode: addNumVM.phoneNumFocusNode.value,
                        onFieldSubmitted: (p0) {},
                        hintText: AppStrings.typeNum,
                        obscureText: false),
                  ],
                )),
            const SizedBox(
              height: 18,
            ),
            const Spacer(),
            Obx(
              () => PrimartyButton(
                title: AppStrings.upload,
                width: 150,
                height: 12,
                icon: '',
                loading: addNumVM.loading.value,
                onTap: () async {
                  await addNumVM.addNum();
                  
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
    );
  }
}

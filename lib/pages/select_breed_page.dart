import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/utils/app_colors.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:dogapp/view_models/breeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/styles.dart';

class SelectBreedPage extends StatelessWidget {
  const SelectBreedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    final RxList<String> filteredItems = <String>[].obs;

    final breeds = Get.put(Breeds());
    void filterList(String query) {
      filteredItems.assignAll(
        breeds.dogBreeds.where((item) => item.contains(query)),
      );
    }

    filteredItems.addAll(breeds.dogBreeds);
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CustomAppBar(title: AppStrings.titleSelectBreed),
            Container(
              // width: 364,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0x3F737373)),
                  borderRadius: BorderRadius.circular(8),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x0F000000),
                    blurRadius: 6,
                    offset: Offset(-2, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AssetImages.search),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: TextField(
                      obscureText: false,
                      controller: searchController,
                      onChanged: (query) => filterList(query),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: Styles.expertSignupPaget2(),
                          hintText: 'Search'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        breeds.dogBreeds[index],
                        style: Styles.expertSignupPaget1(),
                      ),
                      onTap: () {
                        // Add your onTap logic here
                        breeds.breed.value = breeds.dogBreeds[index];

                        Get.back();
                      },
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      )),
    );
  }
}

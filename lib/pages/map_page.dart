import 'package:dogapp/components/appbar.dart';
import 'package:dogapp/utils/assets.dart';
import 'package:dogapp/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomAppBar(title: AppStrings.mapView),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetImages.mapDesign),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 15,
                    right: 15,
                    child: Column(
                      children: [
                        SvgPicture.asset(AssetImages.bait),
                        const SizedBox(
                          height: 10,
                        ),
                        SvgPicture.asset(AssetImages.locationRound),
                      ],
                    ))
              ],
            ),
          ),
        ],
      )),
    );
  }
}

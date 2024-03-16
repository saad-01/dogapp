import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/strings.dart';
import '../utils/styles.dart';

class EventItem extends StatelessWidget {
  const EventItem(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.location,
      required this.time});
  final String title;
  final String subTitle;
  final String location;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 110,
      decoration: const BoxDecoration(
        color: Color(0xffdffbf6),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8.73,
                height: 110,
                color: const Color(0xff028383),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.tr,
                      style: Styles.primaryText()
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      subTitle.tr,
                      style: Styles.black14(),
                    ),
                    Text(
                      'location: $location',
                      style: Styles.black10Sub(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          time.tr,
                          style: Styles.black14(),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              AppStrings.setReminder.tr,
                              style: Styles.primary12UText(),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

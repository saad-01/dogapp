import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dogapp/components/requested_widget.dart';
import 'package:dogapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';

class AppointmentWidget extends StatefulWidget {
  const AppointmentWidget(
      {super.key,
      required this.type,
      required this.name,
      required this.date,
      required this.time,
      required this.image,
      required this.title,
      required this.approvalFlag,
      this.onPress,
      this.showStatus,
      this.id});
  final String type;
  final String name;
  final String date;
  final String time;
  final String image;
  final String title;
  final String? id;
  final bool approvalFlag;
  final bool? showStatus;
  final void Function()? onPress;

  @override
  State<AppointmentWidget> createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  RxString name = ''.obs;
  getDogName(String id) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection(
            'dogs') // Replace 'your_collection' with your collection name
        .doc(id) // Replace 'your_document_id' with your document ID
        .get();
    dynamic fieldValue = snapshot.get('name');
    name.value = fieldValue.toString();
  }

  @override
  void initState() {
    getDogName(widget.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPress,
      child: Ink(
        padding: const EdgeInsets.all(10),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.type == 'Excercise' ? widget.type : widget.type,
                      style: Styles.subPrimaryText(),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (widget.showStatus == null) ...[
                      if (widget.title != 'Requested')
                        StatusWidget(
                            title: widget.title, approval: widget.approvalFlag),
                      if (widget.title == 'Requested')
                        RequestedWidget(
                          title: widget.title,
                        ),
                    ]
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Obx(
                  () => Text(
                    name.value,
                    style: Styles.appointSub(),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.date,
                  style: Styles.appointSub(),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.time,
                  style: Styles.appointSub(),
                ),
              ],
            ),
            SvgPicture.asset(widget.image),
          ],
        ),
      ),
    );
  }
}

class StatusWidget extends StatelessWidget {
  const StatusWidget(
      {super.key, this.color, required this.title, required this.approval});
  final Color? color;
  final String title;
  final bool approval;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 17,
      decoration: ShapeDecoration(
        color: approval ? AppColors.statusBg1 : AppColors.statusBg2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      ),
      child: Center(
          child: Text(
        title,
        style: approval ? Styles.approvalTxt() : Styles.denialTxt(),
      )),
    );
  }
}


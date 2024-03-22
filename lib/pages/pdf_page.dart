import 'package:dogapp/components/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfPage extends StatelessWidget {
  const PdfPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    String url = Get.arguments;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: CustomAppBar(
              title: '',
            ),
          ),
          Expanded(
            child: SfPdfViewer.network(
              url,
            ),
          ),
        ],
      )),
    );
  }
}

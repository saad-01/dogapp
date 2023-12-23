import 'package:dogapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class ParentHomePage extends StatefulWidget {
  const ParentHomePage({super.key});

  @override
  State<ParentHomePage> createState() => _ParentHomePageState();
}

class _ParentHomePageState extends State<ParentHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Home page",
        style: TextStyle(color: AppColors.black, fontSize: 20),
      ),
    );
  }
}

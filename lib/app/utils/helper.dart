// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/controllers/homepage_controller.dart';

import '../modules/values/colors.dart';

class MyHelper {
  static var listPopUpMenuItem = [
    "Aktivitas Tertunda",
    "Aktivitas Selesai",
    "Semua Aktivitas",
  ];

  // static final myAppBar =

  static final myDetailAppBar = AppBar(
    title: Text(
      'Detail Aktivitas',
      style: TextStyle(
          color: MyColors.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w500),
    ),
    iconTheme: IconThemeData(
      color: MyColors.textPrimary, //change your color here
    ),
    centerTitle: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
  static final kategoriAppBar = AppBar(
    backgroundColor: MyColors.primaryColor,
    title: Text('Kategori'),
    centerTitle: true,
  );
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: MyColors.checkColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}

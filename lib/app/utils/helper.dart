// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/values/colors.dart';

class MyHelper {
  static var listPopUpMenuItem = [
    "Aktivitas Tertunda",
    "Aktivitas Selesai",
    "Semua Aktivitas",
  ];

  static final myAppBar = AppBar(
    backgroundColor: MyColors.primaryColor,
    title: Text('Aktivitasku'),
    centerTitle: true,
    actions: [
      PopupMenuButton<String>(
        icon: Image(
            height: myDetailAppBar.preferredSize.height * 0.5,
            width: myDetailAppBar.preferredSize.height * 0.5,
            image: AssetImage("assets/icons/mi_filter.png")),
        itemBuilder: (context) =>
            [...listPopUpMenuItem.map(buildItem).toList()],
      )
    ],
  );

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

  static PopupMenuItem<String> buildItem(String e) {
    return PopupMenuItem(
        child: Text(
      e,
      style: TextStyle(color: MyColors.textPrimary),
    ));
  }
}

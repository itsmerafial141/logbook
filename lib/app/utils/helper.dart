// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/values/colors.dart';

class MyHelper {
  static final myAppBar = AppBar(
    backgroundColor: MyColors.primaryColor,
    title: Text('Aktivitasku'),
    centerTitle: true,
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: IconButton(
          icon: Image(
              height: myDetailAppBar.preferredSize.height * 0.5,
              width: myDetailAppBar.preferredSize.height * 0.5,
              image: AssetImage("assets/icons/mi_filter.png")),
          onPressed: () {},
        ),
      ),
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
}

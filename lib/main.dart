import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';

import 'app/modules/values/colors.dart';
import 'app/routes/app_pages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: MyColors.primaryColor,
  ));
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL_HP,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Kanit',
        primaryColor: MyColors.primaryColor,
      ),
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [Locale('id')],
    ),
  );
}

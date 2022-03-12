// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/widget/custom_button_widget.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';
import 'package:loogbook_mobile_app/app/routes/app_pages.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

import '../controllers/detail_aktivitas_controller.dart';
import '../screens/list_body_detail_aktivitas_screen.dart';

class DetailAktivitasView extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHelper.myDetailAppBar,
      bottomNavigationBar: CustomButton(
        useLeading: false,
        text: "Simpan Aktivitas",
        color: MyColors.primaryColor,
        borderRadius: 5,
        textColor: Colors.white,
        onPressed: () {
          if (controller.checkValueIsValid()) {
            controller.addAktivitases();
            Get.offAllNamed(AppPages.INITIAL_HP);
          } else {
            print("Data harus terisi semua!");
          }
        },
      ),
      body: ListBodyDetailAktivitasScreen(),
    );
  }
}

// ignore_for_file: prefer_adjacent_string_concatenation

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/widget/custom_button_widget.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

import '../controllers/detail_aktivitas_controller.dart';
import '../screens/list_body_detail_aktivitas_screen.dart';

class DetailAktivitasView extends GetView<DetailAktivitasController> {
  final homepageC = Get.put(HomepageController());

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
          print("Id = ${(homepageC.listAktivitas.length + 1).toString()}\n" +
              "Status = false\n" +
              "Target = ${controller.targetController.text}\n" +
              "Realita = ${controller.realitaController.text}\n" +
              "Kategori = ${controller.onKategoriSelected.toString()}\n" +
              "Sub-Aktivitas = subAktivitas\n" +
              "Waktu = ${controller.onWaktuSelected.toString()}\n" +
              "Tanggal = ${controller.formatedDate(controller.initialDate.value).toString()}\n===========================");
          if (controller.checkValueIsValid()) {
            controller.addAktivitas();
            Get.back();
          } else {
            print("Data harus terisi semua!");
          }
        },
      ),
      body: ListBodyDetailAktivitasScreen(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/widget/custom_button_widget.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

import '../controllers/detail_aktivitas_controller.dart';
import '../screens/list_body_detail_aktivitas_screen.dart';

class DetailAktivitasView extends GetView<DetailAktivitasController> {
  // final target = TextEditingController().obs;
  // final realita = TextEditingController().obs;
  // final kategori = TextEditingController().obs;
  // final tanggal = TextEditingController().obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHelper.myDetailAppBar,
      bottomNavigationBar:
          // Obx(
          //   () =>
          // child:
          CustomButton(
        useLeading: false,
        text: "Simpan Aktivitas",
        color: MyColors.primaryColor,
        borderRadius: 5,
        textColor: Colors.white,
        onPressed: () {
          // controller.addAktivitas(
          //   target.value.toString(),
          //   realita.value.toString(),
          //   controller.onKategoriSelected.value,
          //   controller.onWaktuSelected.value,
          //   tanggal.value.toString(),
          // );
        },
      ),
      // ),
      body: ListBodyDetailAktivitasScreen(
        controller: controller,
        // target: target.value,
        // realita: realita.value,
        // kategori: kategori.value,
        // tanggal: tanggal.value,
      ),
    );
  }
}

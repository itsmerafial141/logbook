// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/controllers/detail_aktivitas_controller.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';

import '../widgets/list_data_aktivitas_widget.dart';
import '../widgets/list_kategori_widget.dart';
import '../widgets/tanggal_button_detail_aktivitas_widget.dart';
import '../widgets/target_body_widget.dart';
import '../widgets/tittle_field_widget.dart';
import '../widgets/button_add_sub_aktivitas_widget.dart';
import '../widgets/custom_text_field_widget.dart';
import '../widgets/waktu_detail_aktiitas_widget.dart';

class ListBodyDetailAktivitasScreen extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TittleField(
            tittle: "Target/Ekspektrasi",
          ),
          SizedBox(
            height: 10,
          ),
          TargetBody(),
          SizedBox(
            height: 30,
          ),
          TittleField(tittle: "Realita"),
          SizedBox(
            height: 10,
          ),
          CustomTextFieldWidget(),
          SizedBox(
            height: 10,
          ),
          TittleField(tittle: "Kategori"),
          SizedBox(
            height: 10,
          ),
          ListKategoriWidget(),
          SizedBox(
            height: 20,
          ),
          TittleField(tittle: "Sub-Aktivitas"),
          ListDataSubAktivitas(),
          ButtonAddSubAktivitasWidget(),
          SizedBox(
            height: 10,
          ),
          TittleField(tittle: "Waktu & Tanggal"),
          SizedBox(
            height: 10,
          ),
          WaktuDetialAktivitasWidget(),
          SizedBox(
            height: 10,
          ),
          TanggalButtonDetailAktivitasScreen(),
        ],
      ),
    );
  }
}

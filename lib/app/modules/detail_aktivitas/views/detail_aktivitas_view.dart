import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/detail_aktivitas_model.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/widget/custom_button_widget.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

import '../controllers/detail_aktivitas_controller.dart';
import '../widget/button_add_sub_aktivitas_widget.dart';
import '../widget/custom_text_field_widget.dart';
import '../widget/list_data_aktivitas_widget.dart';
import '../widget/waktu_button_detail_aktivitas_widget.dart';
import 'ListKategori.dart';
import 'target_body.dart';
import 'tittle_field.dart';

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
        onPressed: () {},
      ),
      body: SingleChildScrollView(
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
            ListKategori(),
            SizedBox(
              height: 20,
            ),
            TittleField(tittle: "Sub-Aktivitas"),

            ListDataSubAktivitas(
              controller: controller,
            ),

            // ListSubAktivitasScreen(),
            ButtonAddSubAktivitasWidget(controller: controller),
            SizedBox(
              height: 10,
            ),
            TittleField(tittle: "Waktu & Tanggal"),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                WaktuButtonDetailAktivitasScreen(
                  text: "Sebelum Ashar",
                  suffixIcon: Icons.arrow_drop_down,
                ),
                SizedBox(
                  height: 10,
                ),
                WaktuButtonDetailAktivitasScreen(
                    text: "Senin, 4 Februari 2022",
                    suffixIcon: Icons.date_range),
              ],
            )
          ],
        ),
      ),
    );
  }
}

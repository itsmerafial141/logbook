import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/views/custom_button.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

import '../controllers/detail_aktivitas_controller.dart';
import '../screen/list_aktivitas_screen.dart';
import '../screen/waktu_button_detail_aktivitas_screen.dart';
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
            _realitaBody(),
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
            ListSubAktivitasScreen(),
            Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 15,
                        color: MyColors.textDarkDisable,
                      ),
                      Text(
                        "Tambah Sub-Aktivitas",
                        style: TextStyle(color: MyColors.textDarkDisable),
                      ),
                    ],
                  ),
                )),
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
                    text: "Sebelum Ashar", suffixIcon: Icons.arrow_drop_down,),
                    SizedBox(height: 10,),
                WaktuButtonDetailAktivitasScreen(
                    text: "Senin, 4 Februari 2022", suffixIcon: Icons.date_range),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextField _realitaBody() {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          fillColor: MyColors.checkColor),
      maxLines: 5,
      style:
          TextStyle(fontWeight: FontWeight.w600, color: MyColors.textPrimary),
    );
  }
}

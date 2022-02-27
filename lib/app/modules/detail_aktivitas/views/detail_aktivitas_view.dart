import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

import '../controllers/detail_aktivitas_controller.dart';
import 'target_body.dart';
import 'tittle_field.dart';

class DetailAktivitasView extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHelper.myDetailAppBar,
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
            TextField(
              autofocus: false,
              decoration: InputDecoration(
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                  border: InputBorder.none,
                  fillColor: MyColors.checkColor),
              maxLines: 5,
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: MyColors.textPrimary),
            ),
            SizedBox(
              height: 10,
            ),
            TittleField(tittle: "Kategori"),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

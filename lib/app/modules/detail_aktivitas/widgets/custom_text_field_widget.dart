import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/controllers/detail_aktivitas_controller.dart';

import '../../values/colors.dart';

class CustomTextFieldWidget extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.realitaController,
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

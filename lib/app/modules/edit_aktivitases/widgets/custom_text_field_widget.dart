import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/edit_aktivitases/controllers/edit_aktivitases_controller.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

import '../../values/colors.dart';

class CustomTextFieldWidget extends GetView<EditAktivitasesController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => TextField(
        controller: controller.realitaController,
        decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              5,
            ),
            borderSide: BorderSide.none,
          ),
          fillColor: MyColors.checkColor,
        ),
        maxLines: 5,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: MyColors.textPrimary,
        ),
      ),
      onLoading: LoadingWidget(
        height: 100,
      ),
    );
  }
}

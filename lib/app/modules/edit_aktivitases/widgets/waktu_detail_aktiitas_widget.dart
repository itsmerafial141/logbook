import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/edit_aktivitases/controllers/edit_aktivitases_controller.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

import '../../values/colors.dart';

class WaktuDetialAktivitasWidget extends GetView<EditAktivitasesController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => DropdownSearch<String>(
        mode: Mode.DIALOG,
        maxHeight: 225,
        dropdownSearchTextAlignVertical: TextAlignVertical.center,
        showSelectedItems: true,
        items: controller.itemListWaktu,
        selectedItem: controller.waktuSelected.value,
        onChanged: (value) {
          controller.onWaktuSelected = value.toString();
          print(
            controller.onWaktuSelected.toString(),
          );
        },
        showAsSuffixIcons: false,
        dropdownSearchDecoration: InputDecoration(
          hoverColor: MyColors.primaryColor,
          fillColor: Colors.red,
          contentPadding: EdgeInsets.only(
            top: 3,
            bottom: 3,
            left: 20,
            right: 5,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: MyColors.primaryColor,
            ),
          ),
        ),
      ),
      onLoading: LoadingWidget(
        height: 50,
      ),
    );
  }
}

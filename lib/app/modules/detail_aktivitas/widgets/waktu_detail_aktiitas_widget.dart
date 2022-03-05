import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/controllers/detail_aktivitas_controller.dart';

import '../../values/colors.dart';

class WaktuDetialAktivitasWidget extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      mode: Mode.DIALOG,
      maxHeight: 225,
      dropdownSearchTextAlignVertical: TextAlignVertical.center,
      showSelectedItems: true,
      items: controller.itemListWaktu,
      selectedItem: "Pilih waktu...",
      onChanged: (value) {
        controller.onWaktuSelected = value.toString();
        print(controller.onWaktuSelected.toString());
      },
      showAsSuffixIcons: false,
      dropdownSearchDecoration: InputDecoration(
          hoverColor: MyColors.primaryColor,
          fillColor: Colors.red,
          contentPadding:
              EdgeInsets.only(top: 3, bottom: 3, left: 20, right: 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: MyColors.primaryColor))),
    );
  }
}

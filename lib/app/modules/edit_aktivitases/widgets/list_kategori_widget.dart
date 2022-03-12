import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/edit_aktivitases/controllers/edit_aktivitases_controller.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

import '../../values/colors.dart';

class ListKategoriWidget extends GetView<EditAktivitasesController> {
  @override
  Widget build(BuildContext context) {
    var listKategoriCard =
        List.generate(controller.listKategoriName.length, (int index) {
      return listKategoriIndex(controller.listKategoriName[index], index + 1);
    });
    return controller.obx(
      (_) => GridView.count(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        childAspectRatio: 2 / .7,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: listKategoriCard,
      ),
      onLoading: LoadingWidget(
        height: 100,
      ),
    );
  }

  Widget listKategoriIndex(String tittle, int index) {
    return Container(
      child: Obx(
        () => ElevatedButton(
          onPressed: () {
            controller.selectedKategori.value = index;
            controller.onKategoriSelected = tittle;
          },
          style: ElevatedButton.styleFrom(
            side: BorderSide(
              color: MyColors.primaryColor,
            ),
            shadowColor: Colors.white,
            primary: controller.selectedKategori.value == index
                ? MyColors.primaryColor
                : Colors.white,
          ),
          child: Text(
            tittle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: controller.selectedKategori.value == index
                  ? Colors.white
                  : MyColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

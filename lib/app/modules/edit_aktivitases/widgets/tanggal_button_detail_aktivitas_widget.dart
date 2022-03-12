import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/edit_aktivitases/controllers/edit_aktivitases_controller.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

import '../../values/colors.dart';

class TanggalButtonDetailAktivitasScreen
    extends GetView<EditAktivitasesController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (_) => Container(
        width: double.infinity,
        child: MaterialButton(
          height: 50,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: MyColors.primaryColor,
            ),
          ),
          onPressed: () {
            showDatePicker(
              locale: Locale('id', 'ID'),
              context: context,
              initialDate: controller.initialDate.value,
              firstDate: controller.firstDate.value,
              lastDate: controller.lastDate.value,
            ).then(
              (value) {
                controller.stateTanggal(value!);
                controller.onTanggalSelected.value = controller.formatedDate(
                  controller.initialDate.value,
                );
                print(
                  controller
                      .formatedDate(controller.initialDate.value)
                      .toString(),
                );
              },
            );
          },
          child: Row(
            children: [
              Obx(
                () => Text(
                  controller.onTanggalSelected.value,
                  style: TextStyle(
                    color: MyColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Icon(Icons.date_range)
            ],
          ),
        ),
      ),
      onLoading: LoadingWidget(
        height: 50,
      ),
    );
  }
}

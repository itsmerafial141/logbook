import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/controllers/detail_aktivitas_controller.dart';

import '../../values/colors.dart';

class TargetBody extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MyColors.checkColor),
          child: Obx(
            () => Checkbox(
              onChanged: (_) {
                controller.changeTargetToggle();
              },
              side: BorderSide(style: BorderStyle.none),
              value: controller.onTarget.value,
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          "Re-Design Web Arkatama",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

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
          child: Checkbox(
            onChanged: (_) {},
            side: BorderSide(style: BorderStyle.none),
            value: false,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: TextField(
            controller: controller.targetController,
            decoration: InputDecoration(
                hintText: "Masukkan Target/Ekspektasi...",
                hintStyle: TextStyle(color: MyColors.textDisable),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                filled: true,
                fillColor: MyColors.checkColor,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none)),
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/controllers/detail_aktivitas_controller.dart';

import '../../values/colors.dart';

class TanggalButtonDetailAktivitasScreen extends StatelessWidget {
  const TanggalButtonDetailAktivitasScreen({
    Key? key,
    required this.controller,
    // required this.tanggal,
  }) : super(key: key);

  final DetailAktivitasController controller;
  // final TextEditingController tanggal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:
          // Obx(() {
          //   return
          MaterialButton(
        height: 50,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: MyColors.primaryColor)),
        onPressed: () {
          showDatePicker(
                  context: context,
                  initialDate: controller.initialDate.value,
                  firstDate: controller.firstDate.value,
                  lastDate: controller.lastDate.value)
              .then((value) {
            controller.stateTanggal(value!);
          });
        },
        child: Row(
          children: [
            Obx(
              () => Text(
                DateFormat.EEEE().format(controller.initialDate.value) +
                    ", " +
                    DateFormat("dd MMMM yyyy")
                        .format(controller.initialDate.value),
                style: TextStyle(
                    color: MyColors.textPrimary, fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Icon(Icons.date_range)
          ],
        ),
      ),
      // }),
    );
  }
}

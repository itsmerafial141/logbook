

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../../values/colors.dart';
import '../controllers/homepage_controller.dart';
import '../models/homepage_model.dart';

class CardListViewWidget extends GetView<HomepageController> {
  CardListViewWidget({
    required this.data,
  });
  final Homepage data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Obx(() {
        // ignore: unused_local_variable
        var test = controller.statusCheck.value;
        return Column(
          children: [
            Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: MyColors.checkColor,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Checkbox(
                    onChanged: (state) {
                      controller.stateAktivitas(data);
                    },
                    side: BorderSide.none,
                    value: data.status,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  data.target.toString(),
                  style: TextStyle(
                      decoration: data.status
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: data.status
                          ? MyColors.textDisable
                          : MyColors.textPrimary),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 25.0),
              child: Column(children: [
                Container(
                  width: double.infinity,
                  child: Text(
                    data.realita.toString(),
                    style: TextStyle(color: MyColors.textDisable, fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  color: MyColors.primaryColor,
                )
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    data.waktu.toString(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: MyColors.textDisable),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: MyColors
                          .myListKategoriColor[math.Random().nextInt(3)]),
                  child: Text(
                    data.kategori.toString(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: MyColors.textDisable),
                  ),
                ),
              ]),
            )
          ],
        );
      }),
    );
  }
}

// ignore_for_file: unused_local_variable

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';
import 'package:loogbook_mobile_app/app/routes/app_pages.dart';

import '../models/homepage_model.dart';

class ListAktivitas extends GetView<HomepageController> {
  ListAktivitas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return controller.obx((data) {
      return controller.listData.isEmpty
          ? Container(
              width: deviceWidth,
              child: Image(image: AssetImage("assets/images/empety_list.png")),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return SlidableWidget(
                  data: data![index],
                  indexData: index,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: controller.listData.length);
    }, onLoading: CircularProgressIndicator());
  }
}

class SlidableWidget extends GetView<HomepageController> {
  SlidableWidget({
    required this.data,
    required this.indexData,
  });

  final Homepage data;
  final int indexData;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            Get.toNamed(
              AppPages.INITIAL_DK,
              arguments: [
                {
                  "id": data.id,
                  "edit": true,
                },
              ],
            );
          },
          icon: Icons.edit,
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          label: "Edit",
        ),
        SlidableAction(
          onPressed: (context) {
            print(indexData);
            controller.deleteAktivitas(data.id);
          },
          icon: Icons.delete,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          label: "Delete",
        ),
      ]),
      child: CardListViewWidget(
        data: data,
      ),
    );
  }
}

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

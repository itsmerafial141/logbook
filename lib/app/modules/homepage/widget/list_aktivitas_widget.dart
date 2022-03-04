import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/homepage_model.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';

class ListAktivitas extends GetView<HomepageController> {
  ListAktivitas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Obx(() {
      var listData = controller
          .getDataByDate(controller.formatedDate(controller.selectedDay.value));
      print(listData.length);
      // print(listData[0].toString());
      return listData.isEmpty
          ? Container(
              width: deviceWidth,
              child: Image(image: AssetImage("assets/images/empety_list.png")),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // final listData = controller.listAktivitas[index];
                return SlidableWidget(
                  data: listData[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: listData.length);
    });
  }
}

class SlidableWidget extends StatelessWidget {
  SlidableWidget({
    required this.data,
  });

  final Homepage data;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: ScrollMotion(), children: [
        SlidableAction(
          onPressed: null,
          icon: Icons.edit,
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          label: "Edit",
        ),
        SlidableAction(
          onPressed: null,
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

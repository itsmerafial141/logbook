import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/controllers/detail_aktivitas_controller.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';

class ListAktivitas extends GetView<HomepageController> {
  const ListAktivitas({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Slidable(
              endActionPane: ActionPane(motion: ScrollMotion(), children: [
                SlidableAction(
                  onPressed: null,
                  icon: Icons.edit,
                  backgroundColor: Colors.amber,
                  // foregroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                  label: "Edit",
                ),
                SlidableAction(
                  onPressed: null,
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  // foregroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  label: "Delete",
                ),
              ]),
              child: CardListViewWidget(controller: controller));
        });

    // return CardListViewWidget();

    // Container(
    //   width: deviceWidth,
    //   child: Image(image: AssetImage("assets/images/empety_list.png")),
    // );
  }
}

class CardListViewWidget extends StatelessWidget {
  const CardListViewWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomepageController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
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
                      controller.stateAktivitas();
                    },
                    side: BorderSide.none,
                    value: controller.stateAktivitasValue.value,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Zoom Meet DT 2",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: MyColors.textPrimary),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 25.0),
              child: Column(children: [
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio maecenas ipsum urna, magna risus. Diam facilisis cras.",
                  style: TextStyle(color: MyColors.textDisable, fontSize: 12),
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
                    "Sebelum Dzuhur",
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
                      color: MyColors.discussColor),
                  child: Text(
                    "Disscuss",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: MyColors.textDisable),
                  ),
                ),
              ]),
            )
          ],
        ),
      );
    });
  }
}

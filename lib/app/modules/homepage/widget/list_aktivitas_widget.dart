import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/homepage_model.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';

class ListAktivitas extends StatelessWidget {
  ListAktivitas({
    Key? key,
    required this.deviceWidth,
    required this.controller,
  }) : super(key: key);

  final double deviceWidth;
  final HomepageController controller;

  @override
  Widget build(BuildContext context) {
    // List<Widget> myListWidget =
    //     List.generate(10, (index) => SlidableWidget(controller: controller));
    return Obx(() {
      return controller.listAktivitas.isEmpty
          ? Container(
              width: deviceWidth,
              child: Image(image: AssetImage("assets/images/empety_list.png")),
            )
          : ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final listData = controller.listAktivitas[index];
                // return ListView(
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   children: [
                //     SlidableWidget(
                //       controller: controller,
                //       index: index,
                //       data: listData,
                //     )
                //   ],
                // );
                return SlidableWidget(
                  controller: controller,
                  index: index,
                  data: listData,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: controller.listAktivitas.length);
    });

    // ListView.builder(
    //     shrinkWrap: true,
    //     itemCount: 10,
    //     physics: NeverScrollableScrollPhysics(),
    //     itemBuilder: (context, index) {
    //       return Slidable(
    //           endActionPane: ActionPane(motion: ScrollMotion(), children: [
    //             SlidableAction(
    //               onPressed: null,
    //               icon: Icons.edit,
    //               backgroundColor: Colors.amber,
    //               // foregroundColor: Colors.amber,
    //               foregroundColor: Colors.white,
    //               label: "Edit",
    //             ),
    //             SlidableAction(
    //               onPressed: null,
    //               icon: Icons.delete,
    //               backgroundColor: Colors.red,
    //               // foregroundColor: Colors.red,
    //               foregroundColor: Colors.white,
    //               label: "Delete",
    //             ),
    //           ]),
    //           child: CardListViewWidget(controller: controller));
    //     });

    // return CardListViewWidget();

    // Container(
    //   width: deviceWidth,
    //   child: Image(image: AssetImage("assets/images/empety_list.png")),
    // );
  }
  // , itemCount: null,
}

class SlidableWidget extends StatelessWidget {
  SlidableWidget({
    Key? key,
    required this.controller,
    required this.index,
    required this.data,
  }) : super(key: key);

  final HomepageController controller;
  final Homepage data;
  final int index;

  @override
  Widget build(BuildContext context) {
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
      child: CardListViewWidget(
        controller: controller,
        index: index,
        data: data,
      ),
    );
  }
}

class CardListViewWidget extends StatelessWidget {
  CardListViewWidget({
    Key? key,
    required this.controller,
    required this.index,
    required this.data,
  }) : super(key: key);

  final HomepageController controller;
  final int index;
  final Homepage data;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: controller.obx(
                  (value) {
                    return Checkbox(
                      onChanged: (state) {
                        controller.stateAktivitas(data);
                      },
                      side: BorderSide.none,
                      value: data.status,
                    );
                  },
                  onLoading: Checkbox(
                    onChanged: (state) {
                      controller.stateAktivitas(data);
                    },
                    side: BorderSide.none,
                    value: data.status,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                data.target.toString(),
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
                    color:
                        MyColors.myListKategoriColor[math.Random().nextInt(3)]),
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
  }
}

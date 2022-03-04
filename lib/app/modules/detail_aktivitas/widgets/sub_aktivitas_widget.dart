import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';
import '../detail_aktivitas_model.dart';

class SubAktivitasWidget extends GetView<DetailAktivitasController> {
  const SubAktivitasWidget({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final DetailAktivitasModel data;
  final int index;

  @override
  Widget build(BuildContext context) {
    var tittle = data.tittle.toString();
    TextPainter textPainter = TextPainter()
      ..text = TextSpan(text: tittle)
      ..textDirection = TextDirection.ltr
      ..layout(minWidth: 0, maxWidth: double.infinity);

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 25,
                    height: 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: MyColors.checkColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 25,
                    height: 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: MyColors.checkColor),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                    color: MyColors.checkColor,
                    borderRadius: BorderRadius.circular(2)),
                child: controller.obx(
                  (value) {
                    return Checkbox(
                        side: BorderSide(style: BorderStyle.none),
                        onChanged: (_) {
                          controller.stateSubAktivitas(data);
                        },
                        value: data.status);
                  },
                  onLoading: Checkbox(
                      side: BorderSide(style: BorderStyle.none),
                      onChanged: (_) {
                        controller.stateSubAktivitas(data);
                      },
                      value: false),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                tittle,
                style: TextStyle(color: MyColors.textPrimary),
              ),
              // Stack(
              //   alignment: Alignment.centerLeft,
              //   children: [
              //     controller.obx((state) {
              //       if (data.status) {
              //         return Text(
              //           tittle,
              //           style: TextStyle(color: MyColors.textDisable),
              //         );
              //       } else {
              //         return Text(
              //           tittle,
              //           style: TextStyle(color: MyColors.textPrimary),
              //         );
              //       }
              //     }),
              //     controller.obx(
              //       (state) {
              //         if (data.status) {
              //           return Container(
              //             color: MyColors.textDisable,
              //             width: textPainter.size.width,
              //             height: 2,
              //           );
              //         } else {
              //           return Container();
              //         }
              //       },
              //     ),
              //   ],
              // ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 0.8,
            color: MyColors.primaryColor,
          ),
        ],
      ),
    );
  }
}

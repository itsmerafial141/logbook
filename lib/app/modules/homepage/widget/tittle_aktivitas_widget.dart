import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/controllers/homepage_controller.dart';

import '../../values/colors.dart';

class AktivitasBody extends GetView<HomepageController> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.amber,
      width: deviceWidth,
      child: Row(
        children: [
          Text("Aktivitas",
              style: TextStyle(color: MyColors.textPrimary, fontSize: 18)),
          SizedBox(
            width: 8.0,
          ),
          Obx(() {
            var listData = controller.getDataByDate(
                controller.formatedDate(controller.selectedDay.value));
            return Text(listData.length.toString(),
                style: TextStyle(
                    color: MyColors.amber,
                    fontWeight: FontWeight.w500,
                    fontSize: 18));
          }),
        ],
      ),
    );
  }
}

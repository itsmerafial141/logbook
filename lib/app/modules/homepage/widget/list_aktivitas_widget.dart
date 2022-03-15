// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/widget/slidable_widget.dart';

class ListAktivitas extends GetView<HomepageController> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return controller.obx(
      (data) {
        return data!.isEmpty
            ? Container(
                width: deviceWidth,
                child:
                    Image(image: AssetImage("assets/images/empety_list.png")),
              )
            : ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SlidableWidget(
                    data: data[index],
                    indexData: index,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10,
                  );
                },
                itemCount: data.length,
              );
      },
      onLoading: CircularProgressIndicator(),
    );
  }
}

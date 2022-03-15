

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/homepage_controller.dart';
import '../models/homepage_model.dart';
import 'card_list_view_widget.dart';

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
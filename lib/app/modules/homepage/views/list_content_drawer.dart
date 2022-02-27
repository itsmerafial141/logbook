import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/routes/app_pages.dart';

import 'custom_button_drawer.dart';

class ListContentDrawer extends StatelessWidget {
  const ListContentDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          CustomDrawerButton(
            text: "Laporan Aktivitas",
            paddingTittle: 15,
            image: "assets/icons/fi_activity.png",
            onPressed: () {
              Get.toNamed(AppPages.INITIAL_HP);
            },
          ),
          CustomDrawerButton(
            text: "Kategori",
            paddingTittle: 15,
            image: "assets/icons/u_layer-group.png",
            onPressed: () {
              Get.toNamed(AppPages.INITIAL_KG);
            },
          )
        ],
      ),
    );
  }
}

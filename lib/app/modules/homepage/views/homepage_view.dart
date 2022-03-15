import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';
import 'package:loogbook_mobile_app/app/routes/app_pages.dart';

import '../controllers/homepage_controller.dart';
import '../../../utils/helper.dart';
import '../screen/bulan_ini_screen.dart';
import '../widget/custom_button_widget.dart';
import '../../../utils/main_drawer.dart';

class HomepageView extends GetView<HomepageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: Text('Aktivitasku'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: Image(
                height: MyHelper.myDetailAppBar.preferredSize.height * 0.5,
                width: MyHelper.myDetailAppBar.preferredSize.height * 0.5,
                image: AssetImage("assets/icons/mi_filter.png")),
            onSelected: (item) {
              onSelected(context, item);
            },
            itemBuilder: (context) =>
                [...MyHelper.listPopUpMenuItem.map(buildItem).toList()],
          )
        ],
      ),
      body: BulanIniPage(),
      drawer: MyDrawer(),
      bottomNavigationBar: CustomButton(
        useLeading: true,
        color: MyColors.primaryColor,
        icon: Icons.add,
        sizeIcon: 15.0,
        iconColor: Colors.white,
        text: "Tambah Aktivitas",
        textColor: Colors.white,
        borderRadius: 5,
        onPressed: () {
          Get.toNamed(
            AppPages.INITIAL_DK,
            arguments: [
              {"edit": false},
            ],
          );
        },
      ),
    );
  }

  void onSelected(BuildContext context, String item) {
    switch (item) {
      case "Aktivitas Tertunda":
        // controller.listData.value = controller.getDataByStatus(
        //     false, controller.formatedDate(controller.selectedDay.value));
        controller.getDataByStatus(
          false,
          controller.formatedDate(
            controller.selectedDay.value,
          ),
        );
        print("============tertunda=========");
        print(item);
        print(controller.formatedDate(controller.selectedDay.value));

        break;
      case "Aktivitas Selesai":
        // controller.listData.value = controller.getDataByStatus(
        //     true, controller.formatedDate(controller.selectedDay.value));
        controller.getDataByStatus(
          true,
          controller.formatedDate(
            controller.selectedDay.value,
          ),
        );
        print("============selesai=========");
        print(item);
        print(controller.formatedDate(controller.selectedDay.value));
        break;
      case "Semua Aktivitas":
        // controller.listData.value = controller.getDataByDate(
        //     controller.formatedDate(controller.selectedDay.value));
        controller.getDataByDate(
          controller.formatedDate(
            controller.selectedDay.value,
          ),
        );
        print("=====================");
        print(item);
        break;
    }
  }

  PopupMenuItem<String> buildItem(String e) {
    return PopupMenuItem(
        value: e,
        child: Text(
          e,
          style: TextStyle(color: MyColors.textPrimary),
        ));
  }
}

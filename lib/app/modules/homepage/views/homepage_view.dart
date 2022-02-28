import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';
import 'package:loogbook_mobile_app/app/routes/app_pages.dart';

import '../controllers/homepage_controller.dart';
import '../../../utils/helper.dart';
import '../screen/bulan_ini_screen.dart';
import '../widget/custom_button_widget.dart';
import '../screen/hari_ini_screen.dart';
import '../../../utils/main_drawer.dart';

class HomepageView extends GetView<HomepageController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MyHelper.myAppBar,
        body: TabBarView(
          children: [
            HariIniPage(),
            BulanIniPage(),
          ],
        ),
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
            Get.toNamed(AppPages.INITIAL_DK);
          },
        ),
      ),
    );
  }
}

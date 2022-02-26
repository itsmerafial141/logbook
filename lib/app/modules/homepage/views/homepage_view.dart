import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';

import '../controllers/homepage_controller.dart';
import '../../../utils/helper.dart';
import 'bulan_ini_page.dart';
import 'custom_button.dart';
import 'hari_ini_page.dart';

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
        bottomNavigationBar: CustomButton(
          color: MyColors.primaryColor,
          icon: Icons.add,
          sizeIcon: 15.0,
          iconColor: Colors.white,
          text: "Tambah Aktivitas",
          textColor: Colors.white,
        ),
      ),
    );
  }
}

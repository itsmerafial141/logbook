import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';
import 'package:loogbook_mobile_app/app/modules/values/constraint.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

import '../../../utils/main_drawer.dart';
import '../controllers/kategori_controller.dart';

class KategoriView extends GetView<KategoriController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHelper.kategoriAppBar,
      body: Container(
        color: MyColors.backgroundColor,
        child: SingleChildScrollView(
            primary: false,
            child: GridView.count(
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: MyConstraint.listKategori)),
      ),
      drawer: MyDrawer(),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/routes/app_pages.dart';

import '../../../utils/helper.dart';
import '../screens/list_body_detail_aktivitas_screen.dart';
import '../../homepage/widget/custom_button_widget.dart';
import '../../values/colors.dart';
import '../controllers/edit_aktivitases_controller.dart';

class EditAktivitasesView extends GetView<EditAktivitasesController> {
  final id = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHelper.myDetailAppBar,
      bottomNavigationBar: CustomButton(
        useLeading: false,
        text: "Edit Aktivitas",
        color: MyColors.primaryColor,
        borderRadius: 5,
        textColor: Colors.white,
        onPressed: () {
          if (controller.checkValueIsValid()) {
            print(id);
            controller.editAktivitas(id);
            Get.offAllNamed(AppPages.INITIAL_HP);
          } else {
            print("Data harus terisi semua!");
          }
          
        },
      ),
      body: ListBodyDetailAktivitasScreen(),
    );
  }
}

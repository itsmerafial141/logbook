import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../values/constraint.dart';
import '../controllers/homepage_controller.dart';
import '../widget/calender_widget.dart';
import '../widget/tittle_aktivitas_widget.dart';
import '../widget/list_aktivitas_widget.dart';

class BulanIniPage extends GetView<HomepageController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: MyConstraint.paddingBody,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShowCalendar(),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  AktivitasBody(),
                  SizedBox(
                    height: 20,
                  ),
                  ListAktivitas(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

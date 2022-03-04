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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: MyConstraint.paddingBody * 0.5,
                color: Colors.white,
                child: ShowCalendar()),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: MyConstraint.paddingBody,
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

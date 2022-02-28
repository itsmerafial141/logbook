import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../utils/helper.dart';
import '../../values/colors.dart';
import '../../values/constraint.dart';
import '../controllers/homepage_controller.dart';
import '../widget/tittle_aktivitas_widget.dart';
import '../views/list_aktivitas.dart';

class BulanIniPage extends GetView<HomepageController> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        padding: MyConstraint.paddingBody,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                CalendarDatePicker(
                    initialDate: controller.selectedDate,
                    firstDate: controller.firstDate,
                    lastDate: controller.lastDate,
                    onDisplayedMonthChanged: (month) {
                      controller.changeDateView();
                      controller.formattedDate =
                          DateFormat('MMMM dd').format(month);
                    },
                    onDateChanged: (date) {
                      controller.changeDateView();
                      controller.formattedDate =
                          DateFormat('MMMM dd').format(date);
                    }),
                Positioned(
                  child: Container(
                      color: MyColors.backgroundColor,
                      width: MyHelper.myAppBar.preferredSize.width,
                      height: 52.0,
                      child: MaterialButton(
                        onPressed: () {
                          controller.isCalenderDropdown.value =
                              !controller.isCalenderDropdown.value;
                        },
                        child: Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              controller.stateViewDate.value
                                  ? Text(controller.formattedDate)
                                  : Text(controller.formattedDate),
                              controller.isCalenderDropdown.value
                                  ? Icon(Icons.arrow_drop_up)
                                  : Icon(Icons.arrow_drop_down)
                            ],
                          );
                        }),
                      )),
                ),
                Container(
                  child: Obx(() {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOutQuint,
                      margin: controller.isCalenderDropdown.value
                          ? EdgeInsets.only(
                              top: 136,
                            )
                          : EdgeInsets.only(
                              top: 310,
                            ),
                      padding: EdgeInsets.only(top: 20),
                      color: MyColors.backgroundColor,
                      child: Column(
                        children: [
                          AktivitasBody(deviceWidth: deviceWidth),
                          SizedBox(
                            height: 20,
                          ),
                          ListAktivitas(deviceWidth: deviceWidth)
                        ],
                      ),
                    );
                  }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

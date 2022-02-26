import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/views/aktivitas_body.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/views/list_aktivitas.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';

import '../../values/constraint.dart';
import '../controllers/homepage_controller.dart';
import '../../../utils/helper.dart';
import 'custom_button.dart';
import 'hari_ini_page.dart';

class HomepageView extends GetView<HomepageController> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    var isCalenderDropdown = true;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: MyHelper.myAppBar,
        body: TabBarView(
          children: [
            HariIniPage(),
            SingleChildScrollView(
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
                            onDateChanged: (asdasd) {}),
                        Positioned(
                            child: Container(
                          color: Colors.white,
                          width: MyHelper.myAppBar.preferredSize.width,
                          height: 40.0,
                          child: MaterialButton(
                            onPressed: () {
                              controller.isCalenderDropdown.value =
                                  !controller.isCalenderDropdown.value;
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Februari 2022"),
                                Icon(Icons.arrow_drop_down)
                              ],
                            ),
                          ),
                        )),
                        Container(
                          child: Obx((){
                            return Container(
                            margin: controller.isCalenderDropdown.value
                                ? EdgeInsets.only(
                                    top: 150,
                                  )
                                : EdgeInsets.only(
                                    top: 300,
                                  ),
                            padding: EdgeInsets.only(top: 20),
                            color: Colors.white,
                            child: Column(
                              children: [
                                AktivitasBody(deviceWidth: deviceWidth),
                                ListAktivitas(deviceWidth: deviceWidth)
                              ],
                            ),
                          );
                          }),
                        )
                        // controller.obx((_) { controller
                        //   return Container(
                        //     margin: controller.isCalenderDropdown.value
                        //         ? EdgeInsets.only(
                        //             top: 150,
                        //           )
                        //         : EdgeInsets.only(
                        //             top: 150,
                        //           ),
                        //     padding: EdgeInsets.only(top: 20),
                        //     color: Colors.white,
                        //     child: Column(
                        //       children: [
                        //         AktivitasBody(deviceWidth: deviceWidth),
                        //         ListAktivitas(deviceWidth: deviceWidth)
                        //       ],
                        //     ),
                        //   );
                        // }),
                        // AnimatedCrossFade(
                        //   duration: Duration(microseconds: 1000),
                        //   crossFadeState: isCalenderDropdown
                        //       ? CrossFadeState.showFirst
                        //       : CrossFadeState.showSecond,
                        //   firstChild: Container(
                        //     margin: EdgeInsets.only(top: 150),
                        //     padding: EdgeInsets.only(top: 20),
                        //     color: Colors.white,
                        //     child: Column(
                        //       children: [
                        //         AktivitasBody(deviceWidth: deviceWidth),
                        //         ListAktivitas(deviceWidth: deviceWidth)
                        //       ],
                        //     ),
                        //   ),
                        //   secondChild: Container(
                        //     margin: EdgeInsets.only(top: 250),
                        //     padding: EdgeInsets.only(top: 20),
                        //     color: Colors.red,
                        //     child: Column(
                        //       children: [
                        //         AktivitasBody(deviceWidth: deviceWidth),
                        //         ListAktivitas(deviceWidth: deviceWidth)
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
            ),
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

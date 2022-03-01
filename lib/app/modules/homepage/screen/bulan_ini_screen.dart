import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../values/constraint.dart';
import '../controllers/homepage_controller.dart';
import '../widget/tittle_aktivitas_widget.dart';
import '../widget/list_aktivitas_widget.dart';

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
            // Obx(() {
            //   return
            ShowCalendar(),
            // }),

            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  AktivitasBody(deviceWidth: deviceWidth),
                  SizedBox(
                    height: 20,
                  ),
                  ListAktivitas(deviceWidth: deviceWidth)
                ],
              ),
            ),
            // Stack(
            //   children: [
            //     TableCalendar(
            //         focusedDay: DateTime.now(),
            //         firstDay: controller.firstDate,
            //         lastDay: controller.lastDate),
            //     CalendarDatePicker(
            //         initialDate: controller.selectedDate,
            //         firstDate: controller.firstDate,
            //         lastDate: controller.lastDate,
            //         onDisplayedMonthChanged: (month) {
            //           controller.changeDateView();
            //           controller.formattedDate =
            //               DateFormat('MMMM dd').format(month);
            //         },
            //         onDateChanged: (date) {
            //           controller.changeDateView();
            //           controller.formattedDate =
            //               DateFormat('MMMM dd').format(date);
            //         }),
            //     Positioned(
            //       child: Container(
            //           color: MyColors.backgroundColor,
            //           width: MyHelper.myAppBar.preferredSize.width,
            //           height: 52.0,
            //           child: MaterialButton(
            //             onPressed: () {
            //               controller.isCalenderDropdown.value =
            //                   !controller.isCalenderDropdown.value;
            //             },
            //             child: Obx(() {
            //               return Row(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   controller.stateViewDate.value
            //                       ? Container(
            //                           child: Row(
            //                           children: [
            //                             Text(controller.date + ", "),
            //                             Text(controller.formattedDate),
            //                           ],
            //                         ))
            //                       : Text(controller.formattedDate),
            //                   controller.isCalenderDropdown.value
            //                       ? Icon(Icons.arrow_drop_up)
            //                       : Icon(Icons.arrow_drop_down)
            //                 ],
            //               );
            //             }),
            //           )),
            //     ),
            //     Container(
            //       child: Obx(() {
            //         return AnimatedContainer(
            //           duration: Duration(milliseconds: 500),
            //           curve: Curves.easeInOutQuint,
            //           margin: controller.isCalenderDropdown.value
            //               ? EdgeInsets.only(
            //                   top: 136,
            //                 )
            //               : EdgeInsets.only(
            //                   top: 310,
            //                 ),
            //           padding: EdgeInsets.only(top: 20),
            //           color: MyColors.backgroundColor,
            //           child: Column(
            //             children: [
            //               AktivitasBody(deviceWidth: deviceWidth),
            //               SizedBox(
            //                 height: 20,
            //               ),
            //               ListAktivitas(deviceWidth: deviceWidth)
            //             ],
            //           ),
            //         );
            //       }),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class ShowCalendar extends StatefulWidget {
  const ShowCalendar({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowCalendar> createState() => _ShowCalendarState();
}

class _ShowCalendarState extends State<ShowCalendar> {
  @override
  Widget build(BuildContext context) {
    HomepageController controller = Get.put(HomepageController());
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: controller.firstDate,
      lastDay: controller.lastDate,
      calendarFormat: controller.calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(controller.selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(controller.selectedDay, focusedDay)) {
          setState(() {
            controller.selectedDay = selectedDay;
            controller.focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (controller.calendarFormat != format) {
          setState(() {
            controller.calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        controller.focusedDay = focusedDay;
      },
    );
  }
}

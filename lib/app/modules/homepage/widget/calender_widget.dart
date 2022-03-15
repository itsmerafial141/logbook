import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../controllers/homepage_controller.dart';

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
      locale: "id_ID",
      focusedDay: DateTime.now(),
      firstDay: controller.firstDate,
      lastDay: controller.lastDate,
      calendarFormat: controller.calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(controller.selectedDay.value, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(controller.selectedDay.value, focusedDay)) {
          setState(
            () {
              controller.selectedDay.value = selectedDay;
              controller.focusedDay;
              controller.listData.value = controller.getDataByDate(
                controller.formatedDate(controller.selectedDay.value),
              );
            },
          );
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

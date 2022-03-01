// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class HomepageController extends GetxController with StateMixin {
  // var isCalenderDropdown = true.obs;
  // var stateViewDate = false.obs;
  var stateAktivitasValue = false.obs;

  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime? selectedDay;

  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2022, 12);

  // void changeDateView() {
  //   stateViewDate.toggle();
  // }

  void stateAktivitas() {
    stateAktivitasValue.toggle();
  }
}

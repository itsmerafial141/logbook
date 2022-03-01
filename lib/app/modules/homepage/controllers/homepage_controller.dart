// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomepageController extends GetxController with StateMixin {
  var isCalenderDropdown = true.obs;
  var stateViewDate = false.obs;
  var stateAktivitasValue = false.obs;

  DateTime selectedDate = DateTime.now();
  String formattedDate =
      DateFormat('dd MMMM yyyy').format(DateTime.now()).obs.toString();
  String date =
      DateFormat('EEEE').format(DateTime.now()).obs.toString();

  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2022, 12);

  void changeDateView() {
    stateViewDate.toggle();
  }
  void stateAktivitas() {
    stateAktivitasValue.toggle();
  }

  @override
  void dispose() {
    super.dispose();
    selectedDate = DateTime.now();
  }
}

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/homepage_model.dart';
import 'package:table_calendar/table_calendar.dart';

class HomepageController extends GetxController with StateMixin {
  // var isCalenderDropdown = true.obs;
  // var stateViewDate = false.obs;
  var listAktivitas = List<Homepage>.empty().obs;

  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  DateTime? selectedDay;

  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2022, 12);

  RxBool statusCheck = false.obs;

  void stateAktivitas(Homepage data) {
    statusCheck = data.status.obs;
    statusCheck.toggle();
    data.status = statusCheck.value;
    print(data.target.toString() + " = " + data.status.toString());
    change(statusCheck.value, status: RxStatus.success());
  }

  @override
  void onInit() {
    super.onInit();
    var aktivitas = Homepage(
        id: "0",
        status: false,
        target: "Re-Design Web Arkatama",
        realita:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, et at imperdiet rutrum. Pellentesque amet, mauris, hendrerit mi curabitur facilisis. Dolor enim vitae euismod sed consectetur",
        kategori: "Design",
        subaktivitas: "Analisis",
        waktu: "Sebelum Dzuhur",
        tanggal: "Sabtu, 25 Februari 2022");
    var aktivitas2 = Homepage(
        id: "0",
        status: false,
        target: "Making New Project PWMP",
        realita:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, et at imperdiet rutrum. Pellentesque amet, mauris, hendrerit mi curabitur facilisis. Dolor enim vitae euismod sed consectetur",
        kategori: "Concept",
        subaktivitas: "Wireframe",
        waktu: "Sesudah Dzuhur",
        tanggal: "Sabtu, 25 Februari 2022");
    var aktivitas3 = Homepage(
        id: "0",
        status: false,
        target: "Slicing Logbook",
        realita:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, et at imperdiet rutrum. Pellentesque amet, mauris, hendrerit mi curabitur facilisis. Dolor enim vitae euismod sed consectetur",
        kategori: "Discuss",
        subaktivitas: "Prototyping",
        waktu: "Setelah Ashar",
        tanggal: "Sabtu, 25 Februari 2022");
    listAktivitas.add(aktivitas);
    listAktivitas.add(aktivitas2);
    listAktivitas.add(aktivitas3);
  }

  // void stateAktivitas() {
  //   stateAktivitasValue.toggle();
  // }
}

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/homepage_model.dart';
import 'package:table_calendar/table_calendar.dart';

class HomepageController extends GetxController {
  // var isCalenderDropdown = true.obs;
  // var stateViewDate = false.obs;
  final listAktivitas = List<Homepage>.empty().obs;

  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  var selectedDay = DateTime.now().obs;

  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2030, 12);

  var statusCheck = false.obs;

  void stateAktivitas(Homepage data) {
    statusCheck.value = data.status;
    statusCheck.toggle();
    data.status = statusCheck.value;
    print(data.target.toString() + " = " + data.status.toString());
  }

  String formatedDate(DateTime date) {
    var formatDate = DateFormat("EEEE, d MMMM yyyy", "id_ID");
    return formatDate.format(date);
  }

  List<Homepage> getDataByDate(String date) {
    return listAktivitas.where((element) => element.tanggal == date).toList();
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
        tanggal: "Jumat, 4 Maret 2022");
    var aktivitas2 = Homepage(
        id: "0",
        status: false,
        target: "Making New Project PWMP",
        realita:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, et at imperdiet rutrum. Pellentesque amet, mauris, hendrerit mi curabitur facilisis. Dolor enim vitae euismod sed consectetur",
        kategori: "Concept",
        subaktivitas: "Wireframe",
        waktu: "Sesudah Dzuhur",
        tanggal: "Sabtu, 5 Maret 2022");
    var aktivitas3 = Homepage(
        id: "0",
        status: false,
        target: "Slicing Logbook",
        realita:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, et at imperdiet rutrum. Pellentesque amet, mauris, hendrerit mi curabitur facilisis. Dolor enim vitae euismod sed consectetur",
        kategori: "Discuss",
        subaktivitas: "Prototyping",
        waktu: "Setelah Ashar",
        tanggal: "Minggu, 6 Maret 2022");
    listAktivitas.add(aktivitas);
    listAktivitas.add(aktivitas2);
    listAktivitas.add(aktivitas3);
  }

  // void stateAktivitas() {
  //   stateAktivitasValue.toggle();
  // }
}

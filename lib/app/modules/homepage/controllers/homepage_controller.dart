import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/homepage_model.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/widget/list_aktivitas_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../aktivitas_response.dart';
import '../providers/homepage_provider.dart';

class HomepageController extends GetxController {
  final listAktivitas = List<Homepage>.empty().obs;
  final listData = List<Homepage>.empty().obs;
  final firstDate = DateTime(2010, 1);
  final lastDate = DateTime(2030, 12);
  var selectedDay = DateTime.now().obs;
  var statusCheck = false.obs;

  DateTime focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;

  void stateAktivitas(Homepage data) {
    statusCheck.value = data.status;
    statusCheck.toggle();
    data.status = statusCheck.value;
    print(data.target.toString() + " = " + data.status.toString());
  }

  void deleteAktivitas(String id) {
    listAktivitas.removeWhere((element) => element.id == id);
    listData.removeWhere((element) => element.id == id);
    homepageProvider.deleteAktivitas(id);
  }

  String formatedDate(DateTime date) {
    var formatDate = DateFormat("EEEE, d MMMM yyyy", "id_ID");
    return formatDate.format(date);
  }

  List<Homepage> getDataByDate(String date) {
    return listAktivitas.where((element) => element.tanggal == date).toList();
  }

  List<Homepage> getDataByStatus(bool status, String date) {
    print(status);
    return listAktivitas
        .where((element) => element.status == status && element.tanggal == date)
        .toList();
  }

  @override
  void onInit() {
    super.onInit();

    showAktivitas();
    // var aktivitas = Homepage(
    //     id: "1",
    //     status: false,
    //     target: "Re-Design Web Arkatama",
    //     realita:
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, et at imperdiet rutrum. Pellentesque amet, mauris, hendrerit mi curabitur facilisis. Dolor enim vitae euismod sed consectetur",
    //     kategori: "Design",
    //     subaktivitas: "Analisis",
    //     waktu: "Sebelum Dzuhur",
    //     tanggal: "Jumat, 4 Maret 2022");
    // var aktivitas4 = Homepage(
    //     id: "2",
    //     status: false,
    //     target: "Slicing Logbook Arkatama",
    //     realita:
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, et at imperdiet rutrum. Pellentesque amet, mauris, hendrerit mi curabitur facilisis. Dolor enim vitae euismod sed consectetur",
    //     kategori: "Other",
    //     subaktivitas: "Develop",
    //     waktu: "Sebelum Dzuhur",
    //     tanggal: "Jumat, 4 Maret 2022");
    // var aktivitas2 = Homepage(
    //     id: "3",
    //     status: false,
    //     target: "Making New Project PWMP",
    //     realita:
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, et at imperdiet rutrum. Pellentesque amet, mauris, hendrerit mi curabitur facilisis. Dolor enim vitae euismod sed consectetur",
    //     kategori: "Concept",
    //     subaktivitas: "Wireframe",
    //     waktu: "Sesudah Dzuhur",
    //     tanggal: "Sabtu, 5 Maret 2022");
    // var aktivitas3 = Homepage(
    //     id: "4",
    //     status: false,
    //     target: "Slicing Logbook",
    //     realita:
    //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ac, et at imperdiet rutrum. Pellentesque amet, mauris, hendrerit mi curabitur facilisis. Dolor enim vitae euismod sed consectetur",
    //     kategori: "Discuss",
    //     subaktivitas: "Prototyping",
    //     waktu: "Setelah Ashar",
    //     tanggal: "Minggu, 6 Maret 2022");
    // listAktivitas.add(aktivitas);
    // listAktivitas.add(aktivitas2);
    // listAktivitas.add(aktivitas3);
    // listAktivitas.add(aktivitas4);
    // final dataStorage = GetStorage();
    // var datcheck = dataStorage.read("listAktivitas");
    // if (datcheck != null) {
    //   print(datcheck["id"].toString());
    // }
    // print(listAktivitas.toJson());
    // print(listAktivitas
    //     .elementAt((listAktivitas.indexWhere(
    //             (element) => element.id == "-Mxmk9o4NrvR5HNIf2VT")) +
    //         1)
    //     .realita);
    selectedDay.value = DateTime.now();
    listData.value = getDataByDate(formatedDate(selectedDay.value));
  }

  HomepageProvider homepageProvider = Get.put(HomepageProvider());

  void showAktivitas() {
    try {
      homepageProvider.showAktivitas().then(
        (response) {
          if (response != null) {
            for (var entry in response.entries) {
              for (var data in entry.value.logs) {
                addToListAktivitas(
                    entry.key,
                    data.isDone,
                    data.target,
                    data.reality,
                    data.category,
                    "subAktivitas",
                    data.time,
                    entry.value.timestamp);
              }
            }
            listAktivitas[listAktivitas
                .indexWhere((element) => element.id == "-Mxn0iaJtuE1b1C2kbLp")].realita = "haris";
            print(listAktivitas[listAktivitas
                .indexWhere((element) => element.id == "-Mxn0iaJtuE1b1C2kbLp")].realita);
          }
        },
        onError: (err) {
          throw err.toString();
        },
      );
    } catch (err) {
      throw err.toString();
    }
  }

  void addToListAktivitas(String id, bool status, String target, String realita,
      String kategori, String subAktivitas, String waktu, String tanggal) {
    var aktivitas = Homepage(
        id: id,
        status: status,
        target: target,
        realita: realita,
        kategori: kategori,
        subaktivitas: subAktivitas,
        waktu: waktu,
        tanggal: tanggal);
    listAktivitas.add(aktivitas);
    listData.add(aktivitas);
  }
}

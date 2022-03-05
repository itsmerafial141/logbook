// ignore_for_file: deprecated_member_use, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/detail_aktivitas_model.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/homepage_model.dart';

class DetailAktivitasController extends GetxController with StateMixin {
  var homepageC = Get.put(HomepageController());

  var listSubAktivitas = List<DetailAktivitasModel>.empty().obs;

  RxBool listCheckSubAktivitas = false.obs;
  RxBool statusSelected = false.obs;
  RxInt selectedKategori = 0.obs;

  Rx<DateTime> initialDate = DateTime.now().obs;
  Rx<DateTime> firstDate = DateTime(2000).obs;
  Rx<DateTime> lastDate = DateTime(2030).obs;

  RxBool onConcept = false.obs;
  RxBool onDesign = false.obs;
  RxBool onDiscuss = false.obs;
  RxBool onLearn = false.obs;
  RxBool onReport = false.obs;
  RxBool onOther = false.obs;
  RxBool onTarget = false.obs;
  RxBool dataCheck = false.obs;

  final List<String> itemListWaktu = [
    "Sebelum Dzuhur",
    "Setelah Dzuhur",
    "Setelah Ashar",
    "Overtime",
  ];

  final List<String> itemSubAktivitas = [
    "Analisis",
    "Wireframe",
    "Hi-fi Design",
    "Prototyping",
    "Testing",
    "Development",
    "Bug Fix",
    "Build",
  ];

  final List<String> listKategoriName = [
    "Concept",
    "Design",
    "Discuss",
    "Learn",
    "Report",
    "Other",
  ];

  late TextEditingController targetController;
  late TextEditingController realitaController;
  late String onWaktuSelected;
  late String onKategoriSelected;
  late String onSubAktivitasSelected;

  @override
  void onInit() {
    super.onInit();
    targetController = TextEditingController();
    realitaController = TextEditingController();
    onWaktuSelected = "";
    onKategoriSelected = "";
    onSubAktivitasSelected = "";

    for (var i = 0; i < itemSubAktivitas.length; i++) {
      var subAktivitas =
          DetailAktivitasModel(status: false, tittle: itemSubAktivitas[i]);
      listSubAktivitas.add(subAktivitas);
    }
  }

  void stateTanggal(DateTime value) {
    if (value != null) {
      initialDate.value = value;
    }
  }

  void addSubAktivitas(String tittle) {
    var subAktivitas = DetailAktivitasModel(status: false, tittle: tittle);
    listSubAktivitas.add(subAktivitas);
  }

  String formatedDate(DateTime date) {
    var formatDate = DateFormat("EEEE, d MMMM yyyy", "id_ID");
    return formatDate.format(date);
  }

  void addAktivitas() {
    var aktivitas = Homepage(
        id: (homepageC.listAktivitas.length + 1).toString(),
        status: false,
        target: targetController.text,
        realita: realitaController.text,
        kategori: onKategoriSelected.toString(),
        subaktivitas: onSubAktivitasSelected.toString(),
        waktu: onWaktuSelected.toString(),
        tanggal: formatedDate(initialDate.value).toString());
    homepageC.listAktivitas.add(aktivitas);
    homepageC.listData.value =
        homepageC.getDataByDate(formatedDate(homepageC.selectedDay.value));
  }

  bool checkValueIsValid() {
    return targetController.text.isNotEmpty &&
        realitaController.text.isNotEmpty &&
        onKategoriSelected.toString().isNotEmpty &&
        onSubAktivitasSelected.toString().isNotEmpty &&
        onWaktuSelected.toString().isNotEmpty &&
        formatedDate(initialDate.value).toString().isNotEmpty;
  }

  void stateSubAktivitas(DetailAktivitasModel data) {
    dataCheck.value = data.status;
    dataCheck.toggle();
    data.status = dataCheck.value;
    if (data.status) {
      onSubAktivitasSelected = data.tittle.toString();
    } else {
      onSubAktivitasSelected = "";
    }
    print(onSubAktivitasSelected);
    print(data.tittle + " = " + data.status.toString());
    change(dataCheck.value, status: RxStatus.success());
  }
}

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
  var listAktivitas = List<Homepage>.empty().obs;

  RxBool listCheckSubAktivitas = false.obs;
  var statusSelected = false.obs;

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
  var dataCheck = false.obs;
  // RxString onKategoriSelected = "".obs;

  List<String> myListSubAktivitas = [
    "Analisis",
    "Wireframe",
    "Hi-fi Design",
    "Prototyping",
    "Testing",
  ].obs;

  final List<String> itemListWaktu = [
    "Sebelum Dzuhur",
    "Setelah Dzuhur",
    "Setelah Ashar",
    "Overtime",
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

    var subAktivitas1 = DetailAktivitasModel(status: false, tittle: "Analisis");
    var subAktivitas2 =
        DetailAktivitasModel(status: false, tittle: "Wireframe");
    var subAktivitas3 =
        DetailAktivitasModel(status: false, tittle: "Hi-fi Design");
    var subAktivitas4 =
        DetailAktivitasModel(status: false, tittle: "Prototyping");
    var subAktivitas5 = DetailAktivitasModel(status: false, tittle: "Testing");
    var subAktivitas6 =
        DetailAktivitasModel(status: false, tittle: "Development");
    var subAktivitas7 = DetailAktivitasModel(status: false, tittle: "Bug Fix");
    listSubAktivitas.add(subAktivitas1);
    listSubAktivitas.add(subAktivitas2);
    listSubAktivitas.add(subAktivitas3);
    listSubAktivitas.add(subAktivitas4);
    listSubAktivitas.add(subAktivitas5);
    listSubAktivitas.add(subAktivitas6);
    listSubAktivitas.add(subAktivitas7);
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
    }
    print(onSubAktivitasSelected);
    print(data.tittle + " = " + data.status.toString());
    change(dataCheck.value, status: RxStatus.success());
  }

  void changeTargetToggle() {
    onTarget.toggle();
    print("onTarget : " + onTarget.toString());
  }

  void changeConceptState() {
    onConcept.toggle();
    onKategoriSelected = "Concept";
    print("onConcept : " + onConcept.toString());
  }

  void changeDesignState() {
    onDesign.toggle();
    onKategoriSelected = "Design";
    print("onDesign : " + onDesign.toString());
  }

  void changeDiscussState() {
    onDiscuss.toggle();
    onKategoriSelected = "Discuss";
    print("onDiscuss : " + onDiscuss.toString());
  }

  void changeLearntState() {
    onLearn.toggle();
    onKategoriSelected = "Learn";
    print("onLearn : " + onLearn.toString());
  }

  void changeReportState() {
    onReport.toggle();
    onKategoriSelected = "Report";
    print("onReport : " + onReport.toString());
  }

  void changeOtherState() {
    onOther.toggle();
    onKategoriSelected = "Other";
    print("onOther : " + onOther.toString());
  }
}

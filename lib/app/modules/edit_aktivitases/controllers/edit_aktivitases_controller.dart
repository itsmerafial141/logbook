import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loogbook_mobile_app/app/modules/edit_aktivitases/providers/edit_aktivitas_provider.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/homepage_model.dart';

import '../../detail_aktivitas/detail_aktivitas_model.dart';
import '../../homepage/controllers/homepage_controller.dart';

class EditAktivitasesController extends GetxController with StateMixin {
  var editP = Get.put(EditAktivitasProvider());
  var homepageC = Get.put(HomepageController());

  var listSubAktivitas = List<DetailAktivitasModel>.empty().obs;

  RxBool listCheckSubAktivitas = false.obs;
  RxBool statusSelected = false.obs;
  RxInt selectedKategori = 0.obs;
  RxString waktuSelected = "Pilih waktu....".obs;
  RxString onTanggalSelected = "".obs;

  Rx<DateTime> initialDate = DateTime.now().obs;
  Rx<DateTime> firstDate = DateTime(2000).obs;
  Rx<DateTime> lastDate = DateTime(2030).obs;

  RxBool dataCheck = false.obs;

  late String id;
  late TextEditingController targetController;
  late TextEditingController realitaController;
  late String onWaktuSelected;
  late String onKategoriSelected;
  late String onSubAktivitasSelected;

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

  @override
  void onInit() {
    super.onInit();
    id = Get.arguments;
    targetController = TextEditingController();
    realitaController = TextEditingController();
    onWaktuSelected = "";
    onKategoriSelected = "";
    onSubAktivitasSelected = "";
    onTanggalSelected.value = formatedDate(initialDate.value);

    showEditAktivitas();

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
  }

  void editAktivitas(String id) {
    try {
      editP
          .updateAktivitas(
              id,
              formatedDate(initialDate.value).toString(),
              targetController.text,
              onKategoriSelected.toString(),
              realitaController.text,
              onWaktuSelected.toString())
          .then((value) => editAktivitasOnList(id));
    } catch (err) {
      throw err.toString();
    }
  }

  void editAktivitasOnList(String id) {
    var data = homepageC.listAktivitas[
        homepageC.listAktivitas.indexWhere((element) => element.id == id)];
    var dataSecond = homepageC
        .listData[homepageC.listData.indexWhere((element) => element.id == id)];
    saveToListAktivitas(data);
    saveToListData(dataSecond);
    print("asdasdasd" + formatedDate(initialDate.value).toString());
  }

  void showEditAktivitas() {
    try {
      editP.showEditAktivitas(id).then(
        (response) {
          var data = response.logs[0];
          targetController.text = data.target;
          realitaController.text = data.reality;
          selectedKategori.value = listKategoriName.indexOf(data.category) + 1;
          waktuSelected.value = data.time;
          onWaktuSelected = data.time;
          onTanggalSelected.value = response.timestamp;
          change(null, status: RxStatus.success());
        },
        onError: (err) {
          throw err.toString();
        },
      );
    } catch (err) {
      throw err.toString();
    }
  }

  void addSubAktivitas(String tittle) {
    var subAktivitas = DetailAktivitasModel(status: false, tittle: tittle);
    listSubAktivitas.add(subAktivitas);
  }

  bool checkValueIsValid() {
    return targetController.text.isNotEmpty &&
        realitaController.text.isNotEmpty &&
        onKategoriSelected.toString().isNotEmpty &&
        onSubAktivitasSelected.toString().isNotEmpty &&
        onWaktuSelected.toString().isNotEmpty &&
        formatedDate(initialDate.value).toString().isNotEmpty;
  }

  String formatedDate(DateTime date) {
    var formatDate = DateFormat("EEEE, d MMMM yyyy", "id_ID");
    return formatDate.format(date);
  }

  void saveToListAktivitas(Homepage data) {
    data.target = targetController.text;
    data.realita = realitaController.text;
    data.kategori = onKategoriSelected.toString();
    data.subaktivitas = "subAktivitas";
    data.waktu = onWaktuSelected.toString();
    data.tanggal = formatedDate(initialDate.value).toString();
  }

  void saveToListData(Homepage data) {
    data.target = targetController.text;
    data.realita = realitaController.text;
    data.kategori = onKategoriSelected.toString();
    data.subaktivitas = "subAktivitas";
    data.waktu = onWaktuSelected.toString();
    data.tanggal = formatedDate(initialDate.value).toString();
  }
}

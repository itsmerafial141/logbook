// ignore_for_file: deprecated_member_use, unnecessary_null_comparison
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/models/detail_aktivitas_model.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/controllers/homepage_controller.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/providers/homepage_provider.dart';

import '../../../routes/app_pages.dart';
import '../../homepage/models/homepage_model.dart';
import '../../values/strings.dart';
import '../providers/aktivitas_provider.dart';

class DetailAktivitasController extends GetxController with StateMixin {
  var homepageC = Get.put(HomepageController());
  var homepageProvider = Get.put(HomepageProvider());
  var detailProvider = Get.put(AktivitasProvider());

  var listSubAktivitas = List<DetailAktivitasModel>.empty().obs;

  RxBool listCheckSubAktivitas = false.obs;
  RxBool statusSelected = false.obs;
  RxBool dataCheck = false.obs;

  RxInt selectedKategori = 0.obs;

  RxString waktuSelected = "Pilih waktu....".obs;
  RxString tanggalSelected = "Pilih tanggal...".obs;

  Rx<DateTime> initialDate = DateTime.now().obs;
  Rx<DateTime> firstDate = DateTime(2000).obs;
  Rx<DateTime> lastDate = DateTime(2030).obs;

  late TextEditingController targetController;
  late TextEditingController realitaController;
  late String onWaktuSelected;
  late String onKategoriSelected;
  late String onSubAktivitasSelected;
  late var argument = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    targetController = TextEditingController();
    realitaController = TextEditingController();
    onWaktuSelected = "Pilih waktu...";
    onKategoriSelected = "";
    onSubAktivitasSelected = "";

    for (var i = 0; i < MyList.itemSubAktivitas.length; i++) {
      var subAktivitas = DetailAktivitasModel(
          status: false, tittle: MyList.itemSubAktivitas[i]);
      listSubAktivitas.add(subAktivitas);
    }
    
    if (argument[0]["edit"]) {
      showEditAktivitas();
    } else {
      change(null, status: RxStatus.success());
    }
  }

  void editAktivitas() {
    try {
      detailProvider
          .updateAktivitas(
            argument[0]["id"],
            tanggalSelected.value,
            targetController.text,
            onKategoriSelected.toString(),
            realitaController.text,
            onWaktuSelected.toString(),
          )
          .then(
            (value) => Get.offAllNamed(AppPages.INITIAL_HP),
          );
    } catch (err) {
      throw err.toString();
    }
  }

  void showEditAktivitas() {
    try {
      detailProvider.showEditAktivitas(argument[0]["id"]).then(
        (response) {
          var data = response.logs[0];
          targetController.text = data.target;
          realitaController.text = data.reality;
          selectedKategori.value =
              MyList.listKategoriName.indexOf(data.category) + 1;
          waktuSelected.value = data.time;
          onWaktuSelected = data.time;
          tanggalSelected.value = response.timestamp;
          change(null, status: RxStatus.success());
        },
        onError: (err) {
          change(null, status: RxStatus.error());
          throw err.toString();
        },
      );
    } catch (err) {
      change(null, status: RxStatus.error());
      throw err.toString();
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
    change(null, status: RxStatus.success());
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
  }

  // void addAktivitases() async {
  //   var connectivityResult = await Connectivity().checkConnectivity();
  //   if (connectivityResult == ConnectivityResult.none) {
  //     addAktivitasLocale();
  //   } else {
  //     addAktivitasOnline();
  //   }
  // }

  void addAktivitasToList(String id) {
    var aktivitas = Homepage(
      id: id,
      status: false,
      target: targetController.text,
      realita: realitaController.text,
      kategori: onKategoriSelected.toString(),
      subaktivitas: onSubAktivitasSelected.toString(),
      waktu: onWaktuSelected.toString(),
      tanggal: formatedDate(initialDate.value).toString(),
    );
    homepageC.listAktivitas.add(aktivitas);
    homepageC.getDataByDate(
      formatedDate(
        homepageC.selectedDay.value,
      ),
    );
    Get.offAllNamed(AppPages.INITIAL_HP);
  }

  String formatedDate(DateTime date) {
    var formatDate = DateFormat("EEEE, d MMMM yyyy", "id_ID");
    return formatDate.format(date);
  }

  bool checkValueIsValid() {
    return targetController.text.isNotEmpty &&
        realitaController.text.isNotEmpty &&
        onKategoriSelected.toString().isNotEmpty &&
        onSubAktivitasSelected.toString().isNotEmpty &&
        onWaktuSelected.toString().isNotEmpty &&
        formatedDate(initialDate.value).toString().isNotEmpty;
  }

  // void addAktivitasLocale() {
  //   try {
  //     var aktivitas = Homepage(
  //       id: targetController.text + DateTime.now().millisecond.toString(),
  //       status: false,
  //       target: targetController.text,
  //       realita: realitaController.text,
  //       kategori: onKategoriSelected.toString(),
  //       subaktivitas: "subaktivitas",
  //       waktu: onWaktuSelected.toString(),
  //       tanggal: formatedDate(initialDate.value).toString(),
  //     );
  //     homepageC.listAktivitas.add(aktivitas);
  //     homepageC.getDataByDate(onWaktuSelected.toString());
  //     homepageC.localDataAktivitas.write("localData", homepageC.listAktivitas);
  //     print("add offline");
  //     change(null, status: RxStatus.success());
  //   } catch (err) {
  //     change(null, status: RxStatus.error());
  //     throw err.toString();
  //   }
  // }

  void addAktivitas() {
    try {
      homepageProvider
          .saveAktivitas(
            formatedDate(initialDate.value).toString(),
            targetController.text,
            onKategoriSelected.toString(),
            realitaController.text,
            onWaktuSelected.toString(),
          )
          .then(
            (value) => addAktivitasToList(value.name),
          );
      change(null, status: RxStatus.success());
    } catch (err) {
      change(null, status: RxStatus.error());
      throw err.toString();
    }
  }

  Future<bool> isThereAnInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}

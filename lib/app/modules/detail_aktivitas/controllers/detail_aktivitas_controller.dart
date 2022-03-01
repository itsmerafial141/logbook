import 'dart:convert';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/detail_aktivitas_model.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/providers/aktivitas_provider.dart';

class DetailAktivitasController extends GetxController with StateMixin {
  var listSubAktivitas = List<DetailAktivitasModel>.empty().obs;
  RxBool listCheckSubAktivitas = false.obs;
  final List<AktivitasProvider> _listAktivitas = [];
  var statusSelected = false.obs;
  List<AktivitasProvider> get listAktivitas {
    return _listAktivitas;
  }

  final List<String> mySubAktivitas = [
    "Analisis",
    "Wireframe",
    "Hi-fi Design",
    "Prototyping",
    "Testing",
  ];

  RxBool onConcept = false.obs;
  RxBool onDesign = false.obs;
  RxBool onDiscuss = false.obs;
  RxBool onLearn = false.obs;
  RxBool onReport = false.obs;
  RxBool onOther = false.obs;
  RxBool onTarget = false.obs;

  List<String> myListSubAktivitas = [
    "Analisis",
    "Wireframe",
    "Hi-fi Design",
    "Prototyping",
    "Testing",
  ].obs;

  @override
  void onInit() {
    super.onInit();
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

  void addSubAktivitas() {
    var subAktivitas = DetailAktivitasModel(status: false, tittle: "oooo");
    listSubAktivitas.add(subAktivitas);
  }

  void stateSubAktivitas(DetailAktivitasModel data) {
    listCheckSubAktivitas.toggle();
    data.status = listCheckSubAktivitas.value;
    print(data.tittle + " = " + data.status.toString());
    change(listCheckSubAktivitas.value, status: RxStatus.success());
  }

  void changeTargetToggle() {
    onTarget.toggle();
    print("onTarget : " + onTarget.toString());
  }

  void changeConceptState() {
    onConcept.toggle();
    print("onConcept : " + onConcept.toString());
  }

  void changeDesignState() {
    onDesign.toggle();
    print("onDesign : " + onDesign.toString());
  }

  void changeDiscussState() {
    onDiscuss.toggle();
    print("onDiscuss : " + onDiscuss.toString());
  }

  void changeLearntState() {
    onLearn.toggle();
    print("onLearn : " + onLearn.toString());
  }

  void changeReportState() {
    onReport.toggle();
    print("onReport : " + onReport.toString());
  }

  void changeOtherState() {
    onOther.toggle();
    print("onOther : " + onOther.toString());
  }
}

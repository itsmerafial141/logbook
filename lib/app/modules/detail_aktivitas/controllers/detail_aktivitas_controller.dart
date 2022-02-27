import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/providers/aktivitas_provider.dart';

class DetailAktivitasController extends GetxController {
  var statusSelected = false.obs;
  final List<AktivitasProvider> _listAktivitas = [];
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

  // void selectItem() {
  //   statusSelected.toggle();
  // }

  // void addAktivitas(String tittle) {
  //   _listAktivitas
  //       .add(AktivitasProvider(id: DateTime.now().toString(), tittle: tittle));
  //   notifyListeners();
  // }

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

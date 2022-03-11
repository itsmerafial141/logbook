import 'package:get/get.dart';

import '../controllers/edit_aktivitases_controller.dart';

class EditAktivitasesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditAktivitasesController>(
      () => EditAktivitasesController(),
    );
  }
}

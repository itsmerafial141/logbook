import 'package:get/get.dart';

import 'package:loogbook_mobile_app/app/modules/edit_aktivitases/bindings/edit_aktivitases_binding.dart';
import 'package:loogbook_mobile_app/app/modules/edit_aktivitases/views/edit_aktivitases_view.dart';

import '../modules/detail_aktivitas/bindings/detail_aktivitas_binding.dart';
import '../modules/detail_aktivitas/views/detail_aktivitas_view.dart';
import '../modules/homepage/bindings/homepage_binding.dart';
import '../modules/homepage/views/homepage_view.dart';
import '../modules/kategori/bindings/kategori_binding.dart';
import '../modules/kategori/views/kategori_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL_HP = Routes.HOMEPAGE;
  static const INITIAL_DK = Routes.DETAIL_AKTIVITAS;
  static const INITIAL_KG = Routes.KATEGORI;

  static final routes = [
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => (HomepageView()),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_AKTIVITAS,
      page: () => DetailAktivitasView(),
      binding: DetailAktivitasBinding(),
    ),
    GetPage(
      name: _Paths.KATEGORI,
      page: () => KategoriView(),
      binding: KategoriBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_AKTIVITASES,
      page: () => EditAktivitasesView(),
      binding: EditAktivitasesBinding(),
    ),
  ];
}

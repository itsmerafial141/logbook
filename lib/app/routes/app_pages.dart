import 'package:get/get.dart';

import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/bindings/detail_aktivitas_binding.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/views/detail_aktivitas_view.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/bindings/homepage_binding.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/views/homepage_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL_HP = Routes.HOMEPAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => HomepageView(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_AKTIVITAS,
      page: () => DetailAktivitasView(),
      binding: DetailAktivitasBinding(),
    ),
  ];
}

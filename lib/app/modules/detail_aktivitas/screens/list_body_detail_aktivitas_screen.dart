import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/controllers/detail_aktivitas_controller.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';

import '../widgets/list_data_aktivitas_widget.dart';
import '../widgets/list_kategori_widget.dart';
import '../widgets/tanggal_button_detail_aktivitas_widget.dart';
import '../widgets/target_body_widget.dart';
import '../widgets/tittle_field_widget.dart';
import '../widgets/button_add_sub_aktivitas_widget.dart';
import '../widgets/custom_text_field_widget.dart';

class ListBodyDetailAktivitasScreen extends StatelessWidget {
  ListBodyDetailAktivitasScreen({
    Key? key,
    required this.controller,
    // required this.target,
    // required this.realita,
    // required this.kategori,
    // required this.tanggal,
  }) : super(key: key);

  // final TextEditingController target;
  // final TextEditingController realita;
  // final TextEditingController kategori;
  // final TextEditingController tanggal;

  final DetailAktivitasController controller;
  final List<String> itemListWaktu = [
    "Sebelum Dzuhur",
    "Setelah Dzuhur",
    "Setelah Ashar",
    "Overtime",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TittleField(
            tittle: "Target/Ekspektrasi",
          ),
          SizedBox(
            height: 10,
          ),
          TargetBody(),
          SizedBox(
            height: 30,
          ),
          TittleField(tittle: "Realita"),
          SizedBox(
            height: 10,
          ),
          CustomTextFieldWidget(),
          SizedBox(
            height: 10,
          ),
          TittleField(tittle: "Kategori"),
          SizedBox(
            height: 10,
          ),
          ListKategori(),
          SizedBox(
            height: 20,
          ),
          TittleField(tittle: "Sub-Aktivitas"),
          ListDataSubAktivitas(
            controller: controller,
          ),
          ButtonAddSubAktivitasWidget(controller: controller),
          SizedBox(
            height: 10,
          ),
          TittleField(tittle: "Waktu & Tanggal"),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              // WaktuButtonDetailAktivitasScreen(controller: controller),
              DropdownSearch<String>(
                mode: Mode.DIALOG,
                maxHeight: 225,
                dropdownSearchTextAlignVertical: TextAlignVertical.center,
                showSelectedItems: true,
                items: itemListWaktu,
                selectedItem: "Pilih waktu...",
                hint: "Pilih waktu...",
                onChanged: (value) {
                  // controller.onWaktuSelected.value = value!;
                },
                showAsSuffixIcons: false,
                dropdownSearchDecoration: InputDecoration(
                    hoverColor: MyColors.primaryColor,
                    fillColor: Colors.red,
                    contentPadding:
                        EdgeInsets.only(top: 3, bottom: 3, left: 20, right: 5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: MyColors.primaryColor))),
              ),
              SizedBox(
                height: 10,
              ),
              TanggalButtonDetailAktivitasScreen(
                controller: controller,
                // tanggal: tanggal,
              ),
            ],
          )
        ],
      ),
    );
  }
}

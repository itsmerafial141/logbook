import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/detail_aktivitas_model.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/widget/custom_button_widget.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

import '../controllers/detail_aktivitas_controller.dart';
import '../widget/waktu_button_detail_aktivitas_widget.dart';
import 'ListKategori.dart';
import 'target_body.dart';
import 'tittle_field.dart';

class DetailAktivitasView extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyHelper.myDetailAppBar,
      bottomNavigationBar: CustomButton(
        useLeading: false,
        text: "Simpan Aktivitas",
        color: MyColors.primaryColor,
        borderRadius: 5,
        textColor: Colors.white,
        onPressed: () {},
      ),
      body: SingleChildScrollView(
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
            _realitaBody(),
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

            // ListSubAktivitasScreen(),
            Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    controller.addSubAktivitas();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 15,
                        color: MyColors.textDarkDisable,
                      ),
                      Text(
                        "Tambah Sub-Aktivitas",
                        style: TextStyle(color: MyColors.textDarkDisable),
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 10,
            ),
            TittleField(tittle: "Waktu & Tanggal"),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                WaktuButtonDetailAktivitasScreen(
                  text: "Sebelum Ashar",
                  suffixIcon: Icons.arrow_drop_down,
                ),
                SizedBox(
                  height: 10,
                ),
                WaktuButtonDetailAktivitasScreen(
                    text: "Senin, 4 Februari 2022",
                    suffixIcon: Icons.date_range),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextField _realitaBody() {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          fillColor: MyColors.checkColor),
      maxLines: 5,
      style:
          TextStyle(fontWeight: FontWeight.w600, color: MyColors.textPrimary),
    );
  }
}

class ListDataSubAktivitas extends StatelessWidget {
  const ListDataSubAktivitas({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailAktivitasController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Obx(() {
        return controller.listSubAktivitas.isEmpty
            ? Container(
                child: Text("Kozong"),
              )
            : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.listSubAktivitas.length,
                itemBuilder: (context, index) {
                  final listData = controller.listSubAktivitas[index];
                  return ListSubAktivitasWidget(
                    data: listData,
                    controller: controller,
                    index: index,
                  );
                },
              );
      }),
    );
  }
}

class ListSubAktivitasWidget extends StatelessWidget {
  const ListSubAktivitasWidget({
    Key? key,
    required this.data,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final DetailAktivitasModel data;
  final DetailAktivitasController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 25,
                    height: 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: MyColors.checkColor),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 25,
                    height: 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: MyColors.checkColor),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                    color: MyColors.checkColor,
                    borderRadius: BorderRadius.circular(2)),
                child: controller.obx(
                  (value) {
                    return Checkbox(
                        side: BorderSide(style: BorderStyle.none),
                        onChanged: (_) {
                          controller.stateSubAktivitas(data);
                        },
                        value: data.status);
                  },
                  onLoading: Checkbox(
                      side: BorderSide(style: BorderStyle.none),
                      onChanged: (_) {
                        controller.stateSubAktivitas(data);
                      },
                      value: false),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(data.tittle.toString()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 0.8,
            color: MyColors.primaryColor,
          ),
        ],
      ),
    );
  }
}

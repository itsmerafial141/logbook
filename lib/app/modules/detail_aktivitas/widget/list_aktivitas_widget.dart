import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/providers/aktivitas_provider.dart';

import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';

class ListSubAktivitasScreen extends StatefulWidget {
  const ListSubAktivitasScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<ListSubAktivitasScreen> createState() => _ListSubAktivitasState();
}

class _ListSubAktivitasState extends State<ListSubAktivitasScreen> {
  final myList = List.generate(
    DetailAktivitasController().myListSubAktivitas.length,
    (index) => AktivitasProvider(
        tittle: DetailAktivitasController().myListSubAktivitas[index],
        id: index.toString()),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Obx(
        () => DetailAktivitasController().myListSubAktivitas.isEmpty
            ? Container(
                child: Text("Kozong"),
              )
            : ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ...myList.map(buildSingleCheckbox).toList(),
                ],
              ),
      ),
    );
  }

  Widget buildSingleCheckbox(AktivitasProvider notification) {
    return buildCheckbox(
      notification: notification,
      onClicked: () {
        setState(() {
          final newValue = !notification.status;
          notification.status = newValue;
        });
      },
    );
  }

  Widget buildCheckbox({
    required AktivitasProvider notification,
    required VoidCallback onClicked,
  }) {
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
                child:
                    // Obx(() =>
                    Checkbox(
                  side: BorderSide(style: BorderStyle.none),
                  onChanged: (value) {
                    onClicked();
                  },
                  value: notification.status,
                ),
              ),
              // ),
              SizedBox(
                width: 10,
              ),
              Text(notification.tittle),
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

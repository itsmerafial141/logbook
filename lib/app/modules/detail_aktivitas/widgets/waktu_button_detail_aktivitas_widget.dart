import 'package:flutter/material.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/controllers/detail_aktivitas_controller.dart';

import '../../values/colors.dart';

class WaktuButtonDetailAktivitasScreen extends StatelessWidget {
  const WaktuButtonDetailAktivitasScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailAktivitasController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:
          // Obx(() {
          //   return
          MaterialButton(
        height: 50,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: MyColors.primaryColor)),
        onPressed: () {},
        child: Row(
          children: [
            Text(
              "Sebelum Dzuhur",
              style: TextStyle(
                  color: MyColors.textPrimary, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
      // }),
    );
  }
}

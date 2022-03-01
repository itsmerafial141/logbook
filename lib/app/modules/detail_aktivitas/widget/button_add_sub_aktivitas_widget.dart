import 'package:flutter/material.dart';
import 'package:loogbook_mobile_app/app/modules/detail_aktivitas/widget/custom_text_field_widget.dart';
import 'package:loogbook_mobile_app/app/modules/homepage/widget/custom_button_widget.dart';

import '../../values/colors.dart';
import '../controllers/detail_aktivitas_controller.dart';

class ButtonAddSubAktivitasWidget extends StatelessWidget {
  const ButtonAddSubAktivitasWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailAktivitasController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: MaterialButton(
          onPressed: () {
            // controller.addSubAktivitas();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: MyColors.backgroundColor,
                  insetAnimationCurve: Curves.easeInOut,
                  insetAnimationDuration: Duration(milliseconds: 1000),
                  insetPadding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide.none),
                  child: Container(
                      height: MediaQuery.of(context).size.height*0.5,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          CustomTextFieldWidget(),
                          CustomButton(
                              color: MyColors.primaryColor,
                              text: "Tambah Sub-Aktivitas",
                              textColor: MyColors.textPrimary,
                              useLeading: false,
                              borderRadius: 5,
                              onPressed: () {})
                        ],
                      )),
                );
              },
            );
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
        ));
  }
}

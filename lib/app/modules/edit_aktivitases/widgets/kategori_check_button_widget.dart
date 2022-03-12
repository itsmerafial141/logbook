import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loogbook_mobile_app/app/modules/edit_aktivitases/controllers/edit_aktivitases_controller.dart';

import '../../values/colors.dart';

class CustomKategoriCheckButton extends GetView<EditAktivitasesController> {
  CustomKategoriCheckButton({
    this.text,
    Key? key,
    required this.onPress,
    required this.stateValue,
  }) : super(key: key);

  final String? text;
  final void Function() onPress;
  final RxBool stateValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Obx(
        () => AnimatedContainer(
          child: stateValue.value
              ? ElevatedButton(
                  onPressed: onPress,
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: MyColors.primaryColor),
                      shadowColor: Colors.white,
                      primary: MyColors.primaryColor),
                  child: Text(
                    text!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )
              : ElevatedButton(
                  onPressed: onPress,
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: MyColors.primaryColor),
                      shadowColor: Colors.white,
                      primary: Colors.white),
                  child: Text(
                    text!,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyColors.textPrimary),
                  ),
                ),
          duration: Duration(milliseconds: 2000),
          curve: Curves.bounceIn,
        ),
      ),
    ));
  }
}

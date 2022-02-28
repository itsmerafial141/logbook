import 'package:flutter/material.dart';

import '../../values/colors.dart';

class WaktuButtonDetailAktivitasScreen extends StatelessWidget {
  const WaktuButtonDetailAktivitasScreen({
    Key? key,
    this.text,
    this.suffixIcon,
  }) : super(key: key);

  final String? text;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: MaterialButton(
        height: 50,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: MyColors.primaryColor)),
        onPressed: () {},
        child: Row(
          children: [
            Text(
              text!,
              style: TextStyle(
                  color: MyColors.textPrimary, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(suffixIcon)
          ],
        ),
      ),
    );
  }
}

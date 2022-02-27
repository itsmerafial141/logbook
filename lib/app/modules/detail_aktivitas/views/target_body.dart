import 'package:flutter/material.dart';

import '../../values/colors.dart';

class TargetBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MyColors.checkColor),
          child: Checkbox(
            onChanged: (_) {},
            value: true,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          "Re-Design Web Arkatama",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

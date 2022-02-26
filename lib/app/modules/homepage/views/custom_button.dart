import 'package:flutter/material.dart';

import '../../../utils/helper.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.color,
    this.icon,
    this.text,
    this.textColor,
    this.iconColor,
    this.sizeIcon,
  }) : super(key: key);
  final text;
  final textColor;
  final color;
  final icon;
  final iconColor;
  final sizeIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyHelper.myAppBar.preferredSize.height * 0.5,
      margin: EdgeInsets.all(10.0),
      color: color!,
      child: MaterialButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon!,
              size: sizeIcon!,
              color: iconColor!,
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              text!,
              style: TextStyle(color: textColor!),
            )
          ],
        ),
      ),
    );
  }
}

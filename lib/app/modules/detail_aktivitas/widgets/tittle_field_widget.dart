import 'package:flutter/material.dart';

import '../../values/colors.dart';

class TittleField extends StatelessWidget {
  const TittleField({
    Key? key,
    required this.tittle,
  }) : super(key: key);

  final String tittle;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: deviceWidth,
      child: Text(
        tittle,
        style: TextStyle(color: MyColors.textDisable, fontSize: 14),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ListAktivitas extends StatelessWidget {
  const ListAktivitas({
    Key? key,
    required this.deviceWidth,
  }) : super(key: key);

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth,
      child: Image(image: AssetImage("assets/images/empety_list.png")),
    );
  }
}

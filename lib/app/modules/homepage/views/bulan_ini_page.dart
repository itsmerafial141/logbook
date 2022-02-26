import 'package:flutter/material.dart';

class BulanIniPage extends StatelessWidget {
  const BulanIniPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Bulan ini page")),
      ],
    );
  }
}

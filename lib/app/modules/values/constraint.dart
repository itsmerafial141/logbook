import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import '../kategori/widgets/kategori_card_widget.dart';

class MyConstraint {
  static final EdgeInsets paddingBody = EdgeInsets.all(25.0);

  static var listTittleKategori = [
    "Discuss",
    "Design",
    "Report",
    "Other",
    "Develop",
    "Prototyp",
  ];

  static var listIconKategori = [
    "assets/icons/Discuss.png",
    "assets/icons/Design.png",
    "assets/icons/Report.png",
    "assets/icons/Other.png",
    "assets/icons/Learn.png",
    "assets/icons/Concept.png",
  ];
  static var listKategori =
      List<Widget>.generate(listTittleKategori.length, (int index) {
    return Container(
      child: KategoriCardWidget(
        image: listIconKategori[index],
        tittle: listTittleKategori[index],
        aktivitasCount: math.Random().nextInt(listTittleKategori.length),
      ),
    );
  });
}

import 'package:flutter/material.dart';

import '../../values/colors.dart';

class KategoriCardWidget extends StatelessWidget {
  const KategoriCardWidget({
    required this.image,
    required this.tittle,
    required this.aktivitasCount,
  });

  final String image;
  final String tittle;
  final int aktivitasCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(25),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
                image: AssetImage(image)),
            Spacer(),
            Text(
              tittle,
              style: TextStyle(color: MyColors.textPrimary, fontSize: 20),
            ),
            Row(
              children: [
                Text(
                  "Aktivitas",
                  style: TextStyle(color: MyColors.textDisable, fontSize: 15),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  aktivitasCount.toString(),
                  style: TextStyle(
                      color: MyColors.textDisable,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

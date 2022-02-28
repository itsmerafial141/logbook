import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        children: [
          headerDrawer(context),
          Container(
            width: double.infinity,
            height: 2,
            color: Color.fromARGB(125, 80, 155, 248),
          ),
          listDrawer(),
        ],
      ),
    );
  }

  Container listDrawer() {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          CustomDrawerButton(
            text: "Laporan Aktivitas",
            paddingTittle: 15,
            image: "assets/icons/fi_activity.png",
            onPressed: () {
              Get.toNamed(AppPages.INITIAL_HP);
            },
          ),
          CustomDrawerButton(
            text: "Kategori",
            paddingTittle: 15,
            image: "assets/icons/u_layer-group.png",
            onPressed: () {
              Get.toNamed(AppPages.INITIAL_KG);
            },
          )
        ],
      ),
    );
  }

  Container headerDrawer(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        children: [
          Image.asset("assets/icons/icon_drawer.png"),
          SizedBox(width: 15.0),
          Text(
            "Logbook App",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({
    Key? key,
    required this.paddingTittle,
    required this.text,
    required this.image,
    required this.onPressed,
  }) : super(key: key);
  final double paddingTittle;
  final String text;
  final String image;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      onPressed: onPressed,
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(image))),
          ),
          SizedBox(
            width: paddingTittle,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}

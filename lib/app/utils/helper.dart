import 'package:flutter/material.dart';

class MyHelper {
  static final myAppBar = AppBar(
    title: Text('Aktivitasku'),
    centerTitle: true,
    leading: Icon(Icons.menu),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ),
    ],
    bottom: TabBar(
      tabs: [
        Tab(
          text: "Minggu ini",
        ),
        Tab(
          text: "Bulan",
        ),
      ],
    ),
  );
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_aktivitas_controller.dart';

class DetailAktivitasView extends GetView<DetailAktivitasController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailAktivitasView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailAktivitasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

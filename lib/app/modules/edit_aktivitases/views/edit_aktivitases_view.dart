import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_aktivitases_controller.dart';

class EditAktivitasesView extends GetView<EditAktivitasesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EditAktivitasesView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'EditAktivitasesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

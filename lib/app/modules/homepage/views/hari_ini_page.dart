import 'package:flutter/material.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';
import 'package:loogbook_mobile_app/app/modules/values/constraint.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

import 'aktivitas_body.dart';
import 'list_aktivitas.dart';

class HariIniPage extends StatelessWidget {
  const HariIniPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final bodyHeight = deviceHeight -
        MyHelper.myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    return SingleChildScrollView(
      child: Container(
        padding: MyConstraint.paddingBody,
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.s,
            children: [
              _topBodyDate(deviceWidth),
              SizedBox(
                height: 20.0,
              ),
              AktivitasBody(deviceWidth: deviceWidth),
              SizedBox(
                height: 20,
              ),
              ListAktivitas(deviceWidth: deviceWidth),
            ],
          ),
        ),
      ),
    );
  }

  Container _topBodyDate(double deviceWidth) {
    return Container(
      // color: Colors.red,
      width: deviceWidth,
      child: Text(
        "Senin, 4 Februari 2022",
        style: TextStyle(color: MyColors.textDisable, fontSize: 14),
      ),
    );
  }
}

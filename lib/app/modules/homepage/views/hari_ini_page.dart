import 'package:flutter/material.dart';
import 'package:loogbook_mobile_app/app/modules/values/colors.dart';
import 'package:loogbook_mobile_app/app/utils/helper.dart';

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
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.s,
            children: [
              _topBodyDate(deviceWidth),
              SizedBox(
                height: 20.0,
              ),
              _bodyAktivitas(deviceWidth),
              SizedBox(
                height: 20,
              ),
              _listAktivitas(deviceWidth)
            ],
          ),
        ),
      ),
    );
  }

  Container _listAktivitas(double deviceWidth) {
    return Container(
      width: deviceWidth,
      child: Image(image: AssetImage("assets/images/empety_list.png")),
    );
  }

  Container _bodyAktivitas(double deviceWidth) {
    return Container(
      // color: Colors.amber,
      width: deviceWidth,
      child: Row(
        children: [
          Text("Aktivitas",
              style: TextStyle(color: MyColors.textPrimary, fontSize: 18)),
          SizedBox(
            width: 8.0,
          ),
          Text("0",
              style: TextStyle(
                  color: MyColors.amber,
                  fontWeight: FontWeight.w500,
                  fontSize: 18)),
        ],
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

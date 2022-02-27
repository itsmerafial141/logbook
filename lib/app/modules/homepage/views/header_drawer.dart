import 'package:flutter/material.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

import 'package:flutter/material.dart';

import 'header_drawer.dart';
import 'list_content_drawer.dart';

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
          HeaderDrawer(),
          Container(
            width: double.infinity,
            height: 2,
            color: Color.fromARGB(125, 80, 155, 248),
          ),
          ListContentDrawer()
        ],
      ),
    );
  }
}

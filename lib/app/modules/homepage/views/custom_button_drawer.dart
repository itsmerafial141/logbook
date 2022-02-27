import 'package:flutter/material.dart';

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

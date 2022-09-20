import 'package:flutter/material.dart';

class AppText extends StatelessWidget {

    String text;
    double size;
    Color color;


    AppText({required this.text, this.size=16, this.color=Colors.black54});




  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.normal,
      ),


    );
  }
}

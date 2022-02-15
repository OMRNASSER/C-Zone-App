//custom text for all text in design for more usability in the program
//******* using this Custom Text for Default Text in Program *****//
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String txt;

  final double fontSize;

  final Color color;
   final Alignment alignment ;

  CustomText({
    this.txt = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment  = Alignment.topLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        txt,
        style: TextStyle(
          color: color,
          fontSize: fontSize,

        ),

      ),
      alignment: alignment,
    );
  }
}

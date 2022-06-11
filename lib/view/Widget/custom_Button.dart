//******* Custom Button for any Button ****//
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../../Constant.dart';
import 'CustomText.dart';

class CustomButton extends StatelessWidget {
  final String txt;

   final VoidCallback? onPressed;

  final Color color;

  CustomButton({required this.txt, this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsets.all(18),
        onPressed:onPressed,
        color: color,
        focusColor: primaryColor,
        child: CustomText(
            txt: txt,
            fontSize: 20,
            alignment: Alignment.center,
            color: Colors.white));
  }
}

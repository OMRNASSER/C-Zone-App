import 'package:flutter/material.dart';
import 'CustomText.dart';

class CustomButton extends StatelessWidget {
  final String txt;

  final VoidCallback? onPressed;

  final Color color;
  final shape;
  final textColor;
  const CustomButton({Key? key, required this.txt, this.onPressed, required this.color, this.shape, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(100),
        // ),
        // padding: EdgeInsets.all(18),
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: shape ?? const StadiumBorder(),
          padding: const EdgeInsets.all(16),
        ),
        // focusColor: primaryColor,
        child: CustomText(txt: txt, fontSize: 15, alignment: Alignment.center, color: textColor ?? Colors.white));
  }
}

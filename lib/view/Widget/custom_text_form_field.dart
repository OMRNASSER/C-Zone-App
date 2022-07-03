import 'package:flutter/material.dart';
import 'CustomText.dart';

// ignore: must_be_immutable
class CustomTextForm extends StatelessWidget {
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  bool obsecure = false;
  final String hint;
  final Color color;
  final String txt;
  final TextEditingController? controller  ;
  final Icon? icon ;
  final Color? focusColor;


  CustomTextForm({
    this.color = Colors.black,
    required this.obsecure,
    this.hint = "",
    this.validator,
    this.txt = "",
    this.onSaved,
    this.controller,
    this.icon,
    this.focusColor ,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          txt: txt,
          color: color,
        ),
        //**** Email ***//
        TextFormField(
          onSaved: onSaved,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade200, fontSize: 23),
            fillColor: Colors.white,
            focusColor: focusColor ,
            suffixIcon: icon ,

          ),
          obscureText: obsecure,
        ),
      ],
    );
  }
}

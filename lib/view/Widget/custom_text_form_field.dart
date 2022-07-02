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
  CustomTextForm({
    this.color = Colors.black,
    required this.obsecure,
    this.hint = "",
    this.validator,
    this.txt = "",
    this.onSaved,
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
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade200, fontSize: 23),
            fillColor: Colors.white,
          ),
          obscureText: obsecure,
        ),
      ],
    );
  }
}

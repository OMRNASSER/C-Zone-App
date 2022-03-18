import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constant.dart';
import 'CustomText.dart';

class CustomTextForm extends StatelessWidget {
  final String txt;

  final String hint;

  final Color color;

  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
   bool obsecure= false  ;
  CustomTextForm(
      {this.txt = "",
      this.hint = "",
      this.color = Colors.black,
        this.onSaved ,
        this.validator,
        required this.obsecure,
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
            hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 23),
            fillColor: Colors.white,

          ),
          obscureText: obsecure,
        ),
      ],
    );
  }
}

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
  final Color? focusColor ;
  final Icon? icon ;
  final InputBorder? border ;
   bool obsecure= false  ;
   final TextEditingController? controller ;
  CustomTextForm(
      {this.txt = "",
      this.hint = "",
      this.color = Colors.black,
        this.onSaved ,
        this.validator,
        required this.obsecure,
         this.focusColor,
        this.border ,
        this.icon,
        this.controller,
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
          controller: controller ,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade200, fontSize: 23),
            fillColor: Colors.white,
            focusColor: focusColor ,
            focusedBorder: border ,
            suffixIcon: icon,


          ),
          obscureText: obsecure,
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../Constant.dart';
import 'CustomText.dart';

class CustomTextForm extends StatelessWidget {
  final String txt;

  final String hint;

  final Color color;

  FormFieldValidator<String> validator ;
  FormFieldSetter<String> onSaved ;




  CustomTextForm({this.txt="", this.hint="", this.color = Colors.black ,   required this.onSaved , required  this.validator } );

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
          onSaved:  onSaved,
          validator:validator,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.shade600,fontSize: 23),
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

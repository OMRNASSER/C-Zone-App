import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/view/checkout/delevery_time_widget.dart';

import '../../Constant.dart';

class CheckOutViewModel extends GetxController{



  int get index  =>  _index  ;
  int _index  = 0 ;
  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;



  //Get Color
  Color getColor(int index) {
    if (index == _index) {
      return inProgressColor;
    } else if (index < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }


}
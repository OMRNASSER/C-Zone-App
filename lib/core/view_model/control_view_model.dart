import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/Home_Screen.dart';
import '../../view/cart_view.dart';
import '../../view/profile_view.dart';

// import '../../model/category_model.dart';
// import '../../model/product_model.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;

  get navigatorValue => _navigatorValue;
  Widget _currentScreen = Home_Screen();
  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        {
          _currentScreen = Home_Screen();
          break;
        }
      case 1:
        {
          _currentScreen = CartView();
          break;
        }
      case 2:
        {
          _currentScreen = const ProfileView();
          break;
        }
    }
    update();
  }
}

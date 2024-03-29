import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/core/view_model/auth_view_model.dart';
import 'package:untitled/view/auth/login_screen.dart';

import '../Constant.dart';
import '../core/view_model/control_view_model.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            )
          : LoginScreen();
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: Get.find<ControlViewModel>(),
      builder: (controller) => BottomNavigationBar(
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Explore", style: TextStyle(color: primaryColor)),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset("assets/images/Icon_Explore-mdpi.png"),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text("Cart", style: TextStyle(color: primaryColor)),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset("assets/images/Icon_Cart.png"),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Account",
                style: TextStyle(color: primaryColor),
              ),
            ),
            label: "",
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Image.asset("assets/images/Icon_User.png"),
            ),
          ),
        ],
        elevation: 2,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}

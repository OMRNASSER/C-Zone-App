

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../core/view_model/profile_view_model.dart';
import 'auth/login_screen.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init : ProfileViewModel(),
      builder:(controller) =>  Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [

                      Container(

                        child: Image.asset("assets/images/tenor.gif" , ),
                      ),

                    ],



                  ),
                ) ,

              ],
            ),

          ),
        ),
      ),
    );
  }
}

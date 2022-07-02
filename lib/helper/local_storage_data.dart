import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/model/user_model.dart';
import 'package:get/get.dart';
import 'dart:convert';

import '../Constant.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(CASHED_USER_DATA);
    return UserModel.fromJson(json.decode(value!));
  }

  setUSer(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CASHED_USER_DATA, json.encode(userModel.toJson()));
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

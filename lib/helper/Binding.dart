import 'package:get/get.dart';
import 'package:untitled/core/view_model/auth_view_model.dart';
import 'package:untitled/core/view_model/check_out_viewmodel.dart';
import 'package:untitled/core/view_model/credit_controller.dart';
import 'package:untitled/core/view_model/creditcard_view_model.dart';
import 'package:untitled/core/view_model/home_view_model.dart';

import '../core/view_model/cart_view_model.dart';
import '../core/view_model/control_view_model.dart';
import 'local_storage_data.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => CheckOutViewModel());
    Get.lazyPut(() => CreditCardViewModel(), fenix: true);
    Get.lazyPut(() => CreditController());
  }
}

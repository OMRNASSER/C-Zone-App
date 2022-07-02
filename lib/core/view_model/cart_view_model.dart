import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:untitled/core/services/database/cart_database_helper.dart';
import 'package:untitled/model/cart_product_model.dart';

class CartViewModel extends GetxController {
  List<CartProductModel> get cartProductModel => _cartProductModel;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel = [];
  ValueNotifier<bool> get loading => _loading;
  double get totalPrice => _totalPrice;
  var dbHelper = CartDataBaseHelper.db;
  double _totalPrice = 0.0;

  CartViewModel() {
    getAllProduct();
  }
  getAllProduct() async {
    _loading.value = true;

    _cartProductModel = await dbHelper.getAllProduct();

    _loading.value = false;

    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      double qnt = _cartProductModel[i].quantity.toDouble();
      _totalPrice += (double.parse(_cartProductModel[i].price.toString()) * _cartProductModel[i].quantity.toDouble());
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }
    var dbHelper = CartDataBaseHelper.db;
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    double qnt = cartProductModel.quantity.toDouble();
    _totalPrice += (double.parse(cartProductModel.price.toString()) * cartProductModel.quantity.toDouble());

    update();
  }
    removeProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }
    var dbHelper = CartDataBaseHelper.db;
    await dbHelper.delete(cartProductModel.productId.toString());
    _cartProductModel.remove(cartProductModel);
    double qnt = cartProductModel.quantity.toDouble();
    _totalPrice -= (double.parse(cartProductModel.price.toString()) * cartProductModel.quantity.toDouble());
    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalPrice += (double.parse(cartProductModel[index].price.toString()));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;
    _totalPrice -= (double.parse(cartProductModel[index].price.toString()));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }
}

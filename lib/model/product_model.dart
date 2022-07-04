import 'package:flutter/material.dart';

class ProductModel {
  String? productId, categoryId, name, image, description, sized, price, brand;
  Color? color;
  List<String>? imagesList;
  ProductModel({
    this.name,
    this.image,
    this.description,
    this.color,
    this.sized,
    this.price,
    this.brand,
    this.productId,
    this.categoryId,
    this.imagesList,
  });
  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = Colors.red;
    brand = map['brand'];
    sized = map['sized'];
    price = map['price'];
    productId = map['productId'] ?? '';
    categoryId = map['categoryId'] ?? '';
    imagesList = getImageList(map['imagesList'] == null ? [] : map['imagesList'].toList());
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized': sized,
      'price': price,
      'brand': brand,
      'productId': productId,
      'categoryId': categoryId,
    };
  }
}

List<String> getImageList(List list) {
  List<String> temp = [];
  list.map((e) => temp.add(e.toString())).toList();
  return temp;
}

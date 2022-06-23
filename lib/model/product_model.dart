import 'dart:ui';

import 'package:untitled/helper/extension.dart';

class ProductModel {
  String? productId ,  name , image , description  , sized , price ,brand  ;
  Color? color ;
  ProductModel({
    this.name,
    this.image,
    this.description,
    this.color,
    this.sized,
      this.price,
    this.brand,
    this.productId ,
  });
  ProductModel.fromJson(Map<dynamic , dynamic> map ){
    if (map == null ){
      return ;
    }
    name  = map['name'];
    image  = map['image'];
    description  = map['description'];
    color = HexColor.fromHex(map['color']);
    sized  = map['sized'];
    price  = map['price'];
    brand  = map['brand'];
    productId  = map['productId'];

  }
  toJson(){
    return {
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'sized':sized,
      'price':price,
      'brand':brand,
      'productId':productId ,
    };
  }





}
import 'dart:ui';

import 'package:untitled/helper/extension.dart';

class ProductModel {
  String? productId ,  name , image , description  , sized , price ,brand   ,image1;
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
    this.image1 ,
  });
  ProductModel.fromJson(Map<dynamic , dynamic> map ){
    if (map == null ){
      return ;
    }
    name  = map['name'];
    image  = map['image'];
    image1  = map['image1'];
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
      'image1':image1 ,
    };
  }





}
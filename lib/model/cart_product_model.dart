class CartProductModel {
  String? name, image, price, productId;
  int quantity = 1;

  CartProductModel({
    this.name,
    this.image,
    this.price,
    this.quantity = 1,
    this.productId,
  });
  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    productId = map['productId'];
  }
  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId,
    };
  }
}

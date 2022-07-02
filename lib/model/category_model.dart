class CategoryModel {
  String? name, image, categoryId;
  bool? selected;
  CategoryModel({this.name, this.image, this.categoryId, this.selected});

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['Image'];
    categoryId = map['categoryId'];
    selected = false;
  }
  toJson() {
    return {
      'name': name,
      'Image': image,
      'categoryId': categoryId,
      'selected': false,
    };
  }
}

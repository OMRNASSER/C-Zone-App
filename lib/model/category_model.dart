


class CategoryModel {

  String?  name  , image ;
  CategoryModel({ this.name, this.image});

  CategoryModel.fromJson(Map<dynamic , dynamic> map ){
    if (map == null ){
      return ;
    }
    name= map['name'];
    image = map['Image'] ;

  }
  toJson (){
    return {
      'name' : name ,
      'image': image ,
    } ;

  }
}
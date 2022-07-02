//class for cloud fire store

class UserModel {
  String? userId, email, name, pic, role;

  UserModel({this.userId, this.email, this.name, this.pic, this.role});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
    role = map['role'];
  }
  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'role': role,
    };
  }
}

class LoginModel {
  int? status;
  String? message;
  DataLogin? data;

  LoginModel.formJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['massage'];
    data = json['data'] != null ? DataLogin.formJson(json['data']) : null;
  }
}

class DataLogin {
  String? token;
  UserData? user;

  DataLogin.formJson(Map<String, dynamic> json) {
    token = json['token'];
    user = UserData.formJson(json['user']);
  }
}

class UserData {
  int? id;
  String? name;
  String? phone;
  String? createdAt;
  String? updatedAt;

  UserData.formJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

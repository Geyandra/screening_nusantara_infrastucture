

class LoginModel {
  LoginModel({
    required this.message,
    required this.token,
  });

  String message;
  String? token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json["message"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
      };
}



class DataLogin {
  String? id;
  String? name;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  DataLogin(
      {this.id,
      this.name,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  DataLogin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
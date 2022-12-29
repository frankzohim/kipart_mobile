class UserModel {
  int? id;
  String name;
  String email;
  String phoneNumber;
  String password;
  String? token;
  String? accessToken;

  UserModel(
      {this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.password,
      required this.token,
      this.accessToken});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "name": name,
      "email": email,
      "phone_number": phoneNumber,
      "password": password,
      "token": token,
      "access_token": accessToken
    };
  }

  factory UserModel.fromMap(Map<dynamic, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        password: json['password'],
        token: json['token'],
        accessToken: json["access_token"]);
  }
}

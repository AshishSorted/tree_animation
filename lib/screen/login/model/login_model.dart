import 'dart:convert';

LoginUserModel loginUserModelFromJson(String str) =>
    LoginUserModel.fromJson(json.decode(str));

String loginUserModelToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {
  LoginUserModel({
    // this.user,
    this.accessToken,
    this.refreshToken,
  });

  // User? user;
  String? accessToken;
  String? refreshToken;

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        // user: User.fromJson(json["user"]),
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        // "user": user!.toJson(),
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
//
// User userFromJson(String str) => User.fromJson(json.decode(str));
//
// String userToJson(User data) => json.encode(data.toJson());


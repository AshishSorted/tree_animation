import 'dart:convert';

import 'package:tree_animation/model/user.dart';



class VerifyOtpResponse {
  String? accessToken;
  String? refreshToken;
  User? user;
  VerifyOtpResponse({
    this.accessToken,
    this.refreshToken,
    this.user,
  });

  VerifyOtpResponse copyWith({
    String? accessToken,
    String? refreshToken,
    User? user,
  }) {
    return VerifyOtpResponse(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'user': user?.toMap(),
    };
  }

  factory VerifyOtpResponse.fromMap(Map<String, dynamic> map) {
    return VerifyOtpResponse(
      accessToken:
          map['access_token'] != null ? map['access_token'] as String : null,
      refreshToken:
          map['refresh_token'] != null ? map['refresh_token'] as String : null,
      user: map['user'] != null
          ? User.fromMap(map['user'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyOtpResponse.fromJson(String source) =>
      VerifyOtpResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'VerifyOtpResponse(access_token: $accessToken, refresh_token: $refreshToken, user: $user)';
}

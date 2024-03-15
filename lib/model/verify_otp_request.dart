import 'dart:convert';

VerifyOtpRequest verifyOtpRequestFromJson(String str) =>
    VerifyOtpRequest.fromJson(json.decode(str));

String verifyOtpRequestToJson(VerifyOtpRequest data) =>
    json.encode(data.toJson());

class VerifyOtpRequest {
  VerifyOtpRequest({
    required this.otp,
    required this.phoneNumber,
  });

  String otp;
  String phoneNumber;

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      VerifyOtpRequest(otp: json["otp"], phoneNumber: json["phone_number"]);

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "phone_number": phoneNumber,
      };
}

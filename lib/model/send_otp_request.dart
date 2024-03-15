import 'dart:convert';

SendOtpRequest sendOtpRequestFromJson(String str) =>
    SendOtpRequest.fromJson(json.decode(str));

String sendOtpRequestToJson(SendOtpRequest data) => json.encode(data.toJson());

class SendOtpRequest {
  SendOtpRequest({
    required this.countryCode,
    required this.phoneNumber,
  });

  String countryCode;
  String phoneNumber;

  factory SendOtpRequest.fromJson(Map<String, dynamic> json) => SendOtpRequest(
      countryCode: json["country_code"], phoneNumber: json["phone_number"]);

  Map<String, dynamic> toJson() => {
        "country_code": countryCode,
        "phone_number": phoneNumber,
      };
}

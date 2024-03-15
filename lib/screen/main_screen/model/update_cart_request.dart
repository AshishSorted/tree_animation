import 'dart:convert';

UpdateCartRequest updateCartRequestFromJson(String str) =>
    UpdateCartRequest.fromJson(json.decode(str));

String updateCartRequestToJson(UpdateCartRequest data) =>
    json.encode(data.toJson());

class UpdateCartRequest {
  UpdateCartRequest({
    this.addressId,
    this.storeId,
    this.deliveryDate,
    // this.location,
    this.societyId,
    this.slotId,
    this.customerId,
    this.channel,
  });

  int? addressId;
  int? storeId;
  int? slotId;
  int? societyId;
  String? customerId;
  String? deliveryDate;
  String? channel;
  // int? societyId;
  // Location? location;

  factory UpdateCartRequest.fromJson(Map<String, dynamic> json) =>
      UpdateCartRequest(
        addressId: json["addressId"],
        storeId: json["storeId"],
        slotId: json["slotId"],
        societyId: json["societyId"],
        customerId: json["customerId"],
        deliveryDate: json["deliveryDate"],
        channel: json["societyId"],
        // location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
    "addressId": addressId,
    "storeId": storeId,
    "slotId": slotId,
    "societyId": societyId,
    "customerId": customerId,
    "deliveryDate": deliveryDate,
    "channel": channel,
  };
}

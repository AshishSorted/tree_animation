import 'dart:convert';

import 'inventory.dart';

CartRequest cartRequestFromJson(String str) =>
    CartRequest.fromJson(json.decode(str));

String cartRequestToJson(CartRequest data) => json.encode(data.toJson());

class CartRequest {
  CartRequest({
    this.channel = "App",
    this.deliveryDate,
    this.quantity,
    this.skuCode,
    // this.location,
    this.pieceQty,
    this.time,
    this.addressId,
    this.contactDetail,
    this.slotId,
    this.societyId,
    this.grades,
    this.customerId,
    this.notes,
  });

  String? channel;
  String? deliveryDate;
  double? quantity;
  String? skuCode;
  String? customerId;
  // Location? location;
  int? pieceQty;
  int? time;
  String? addressId;
  String? contactDetail;
  String? notes;
  int? slotId;
  int? societyId;
  List<Grade>? grades;

  factory CartRequest.fromJson(Map<String, dynamic> json) => CartRequest(
        channel: json["channel"],
        notes: json["notes"],
        deliveryDate: json["deliveryDate"],
        quantity: json["quantity"].toDouble,
        skuCode: json["skuCode"],
        customerId: json["customerId"],
        // location: Location.fromJson(json["location"]),
        pieceQty: json["pieceQty"],
        time: json["time"],
        addressId: json["addressId"],
        contactDetail: json["contactDetail"],
        slotId: json["slotId"],
        societyId: json["time"],
        grades: List<Grade>.from(
          json["grades"].map(
            (x) => Grade.fromJson(x ?? {}),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "channel": channel,
        "notes": notes,
        "deliveryDate": deliveryDate,
        "quantity": quantity,
        "skuCode": skuCode,
        "customerId": customerId,
        // "location": location!.toJson(),
        "pieceQty": pieceQty,
        "time": time,
        "addressId": addressId,
        "contactDetail": contactDetail,
        "slotId": slotId ?? "",
        "societyId": societyId,
        "grades": grades == null
            ? null
            : List<dynamic>.from(grades!.map((x) => x.toJson())),
      };
}

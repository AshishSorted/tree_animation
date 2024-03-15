import 'dart:convert';

CreateOrderRequestModel createOrderModelFromJson(String str) =>
    CreateOrderRequestModel.fromJson(json.decode(str));

String createOrderModelToJson(CreateOrderRequestModel data) =>
    json.encode(data.toJson());

class CreateOrderRequestModel {
  CreateOrderRequestModel({
    this.channel,
    this.customerId,
    this.deliveryAddress,
    this.notes,
    this.metaData,
    this.paymentMethod,
    this.shippingMethod,
    this.slotId,
    this.orderItems,
    this.offerData,
  });

  final String? channel;
  final String? customerId;
  final int? slotId;
  final int? deliveryAddress;
  final String? notes;

  final MetaData? metaData;
  final String? paymentMethod;
  final String? shippingMethod;
  final List<OrderItemReq>? orderItems;
  final dynamic offerData;

  factory CreateOrderRequestModel.fromJson(Map<String, dynamic> json) =>
      CreateOrderRequestModel(
        channel: json["channel"],
        customerId: json["customerId"],
        deliveryAddress: json["deliveryAddress"],
        notes: json["notes"],
        slotId: json['slotId'],
        metaData: MetaData.fromJson(json["metadata"]),
        paymentMethod: json["paymentMethod"],
        shippingMethod: json["shippingMethod"],
        orderItems: List<OrderItemReq>.from(
            json["orderItems"].map((x) => OrderItemReq.fromJson(x))),
        offerData: json["offerData"],
      );

  Map<String, dynamic> toJson() => {
        "channel": channel,
        "customerId": customerId,
        "deliveryAddress": deliveryAddress,
        "notes": notes,
        "slotId":slotId,
        "metadata": metaData?.toJson(),
        "paymentMethod": paymentMethod,
        "shippingMethod": shippingMethod,
        "orderItems":
            List<dynamic>.from(orderItems ?? [].map((x) => x.toJson())),
        "offerData": offerData,
      };

  @override
  String toString() {
    return 'CreateOrderRequestModel(channel: $channel, customerId: $customerId, deliveryAddress: $deliveryAddress, notes: $notes, metadata: $metaData, paymentMethod: $paymentMethod, shippingMethod: $shippingMethod, orderItems: $orderItems, offerData: $offerData)';
  }
}

class MetaData {
  MetaData({
    this.contactDetail,
    this.location,
  });

  final ContactDetail? contactDetail;
  final Location? location;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        contactDetail: ContactDetail.fromJson(json["contactDetail"]),
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "contactDetail": contactDetail?.toJson(),
        "location": location?.toJson(),
      };
}

class ContactDetail {
  ContactDetail({
    this.name,
    this.phone,
  });

  final String? name;
  final String? phone;

  factory ContactDetail.fromJson(Map<String, dynamic> json) => ContactDetail(
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
      };
}

class Location {
  Location({
    this.lat,
    this.long,
  });

  final num? lat;
  final num? long;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "long": long,
      };
}

class OrderItemReq {
  OrderItemReq({
    this.orderedQty,
    this.quantity,
    this.skuCode,
    this.whId,
    this.moq,
  });

  final num? orderedQty;
  final num? quantity;
  final String? skuCode;
  final int? whId;
  final double? moq;

  factory OrderItemReq.fromJson(Map<String, dynamic> json) => OrderItemReq(
        orderedQty: json["orderedQty"],
        quantity: json["quantity"],
        skuCode: json["skuCode"],
        whId: json["whId"],
        moq: json["moq"],
      );

  Map<String, dynamic> toJson() => {
        "orderedQty": orderedQty,
        "quantity": quantity,
        "skuCode": skuCode,
        "moq": moq,
        "whId": whId,
      };
}

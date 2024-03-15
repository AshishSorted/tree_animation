import 'dart:convert';


import 'create_order_response_model.dart';
import 'inventory.dart';

CartResponse cartResponseFromJson(str) => CartResponse.fromJson(str);

String cartResponseToJson(CartResponse data) => json.encode(data.toJson());

class CartResponse {
  CartResponse({
    this.status = false,
    this.data,
    this.message = '',
  });

  bool? status;
  CartData? data;
  String message;

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
        status: json["status"],
        data: json["data"] != null ? CartData.fromJson(json["data"]) : null,
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

List<CartData> dataListFromJson(String str) =>
    List<CartData>.from(json.decode(str).map((x) => CartData.fromJson(x)));

String dataListToJson(List<CartData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

CartData dataFromJson(String str) => CartData.fromJson(json.decode(str));

String dataToJson(CartData data) => json.encode(data.toJson());

class CartData {
  CartData({
    this.id,
    this.customerId,
    this.displayOrderId,
    this.storeId,
    this.storeName,
    this.quantity,
    this.totalMrpGrossAmount,
    this.totalSpGrossAmount,
    this.totalDiscountAmount,
    this.totalTaxAmount,
    this.totalExtraFeeAmount,
    this.refundAmount,
    this.finalBillAmount,
    this.estimatedBillAmount,
    this.amountReceived,
    this.totalAdditionalDiscount,
    this.extraFeeDetails,
    this.itemCount,
    this.channel,
    this.shippingMethod,
    this.paymentMethod,
    this.orderItems,
    // this.refundOrders,
    this.status,
    this.deliveryAddress,
    // this.deliveryTime,
    this.notes,
    this.metadata,
    this.submittedAt,
    this.orderCharges,
    this.offerData,
    this.bufferETAMessage,
    this.walletError,
    this.walletBalance,
    this.checkoutMessage,
    this.etaMessage,
    this.walletLoyaltyCoins,
    this.finalBillCoins,
    this.coinsReceived,
    this.cartCoinsEarned,
    this.coinsAfterDeduction,
    this.orderCount,
    this.cartImages,
    // this.deliveryChargesAndOffer,
    // this.statusEnum,
    this.modifiedAt,
    this.slotId,
    this.deliveryDate,
    // this.pageAction,
    this.isRefunded,
    // this.invoice,
  });

  String? id;
  String? customerId;
  String? displayOrderId;
  String? storeId;
  String? storeName;
  DateTime? modifiedAt;
  double? quantity;
  double? totalMrpGrossAmount;
  double? totalSpGrossAmount;
  double? totalDiscountAmount;
  double? totalTaxAmount;
  double? totalExtraFeeAmount;
  double? refundAmount;
  double? finalBillAmount;
  double? estimatedBillAmount;
  double? amountReceived;
  AdditionalDiscount? totalAdditionalDiscount;
  ExtraFeeDetails? extraFeeDetails;
  int? itemCount;
  String? channel;
  String? shippingMethod;
  String? paymentMethod;
  List<CartOrderItem>? orderItems;
  // List<RefundOrder>? refundOrders;
  String? status;
  // String? deliveryTime;
  // OrderStatus? statusEnum;
  int? deliveryAddress;
  int? slotId;
  String? notes;
  Metadata? metadata;
  String? submittedAt;
  List<OrderCharges>? orderCharges;
  OfferData? offerData;
  String? bufferETAMessage;
  bool? walletError;
  double? walletBalance;
  String? checkoutMessage;
  String? etaMessage;
  double? walletLoyaltyCoins;
  double? finalBillCoins;
  double? coinsReceived;
  double? cartCoinsEarned;
  double? coinsAfterDeduction;
  num? orderCount;
  DateTime? deliveryDate;
  List<dynamic>? cartImages;
  // DeliveryChargesAndOffer? deliveryChargesAndOffer;
  // TicketWindow? pageAction;
  int? isRefunded;
  // InvoiceInfo? invoice;

  factory CartData.fromJson(Map<String, dynamic> json) => CartData(
        // id: json["id"],
        // customerId: json["customerId"],
        displayOrderId: json["displayOrderId"],
        // storeId: json["storeId"],
        // storeName: json['storeName'],
        // quantity: json["quantity"]?.toDouble(),
        // totalMrpGrossAmount: json["totalMrpGrossAmount"]?.toDouble(),
        totalSpGrossAmount: json["totalSpGrossAmount"]?.toDouble(),
        totalDiscountAmount: json["totalDiscountAmount"]?.toDouble(),
        totalTaxAmount: json["totalTaxAmount"]?.toDouble(),
        totalExtraFeeAmount: json["totalExtraFeeAmount"]?.toDouble(),
        refundAmount: json["refundAmount"]?.toDouble(),
        finalBillAmount: json["finalBillAmount"]?.toDouble(),
        estimatedBillAmount: json["estimatedBillAmount"]?.toDouble(),
        // amountReceived: json["amountReceived"]?.toDouble(),
        // totalAdditionalDiscount: json["totalAdditionalDiscount"] != null
        //     ? AdditionalDiscount.fromJson(json["totalAdditionalDiscount"])
        //     : AdditionalDiscount(offerDiscount: 0.0),
        // extraFeeDetails: json["extraFeeDetails"] != null
        //     ? ExtraFeeDetails.fromJson(json["extraFeeDetails"])
        //     : ExtraFeeDetails(deliveryCharge: 0.0),
        // itemCount: json["itemCount"],
        // channel: json["channel"],
        // shippingMethod: json["shippingMethod"],
        // paymentMethod: json["paymentMethod"],
        orderItems: json["orderItems"] != null
            ? List<CartOrderItem>.from(
                json["orderItems"].map((x) => CartOrderItem.fromJson(x ?? {})))
            : [],
        // refundOrders: json["refundOrders"] != null
        //     ? List<RefundOrder>.from(
        //     json["refundOrders"].map((x) => RefundOrder.fromMap(x ?? {})))
        //     : [],
        status: json["status"],
        deliveryDate: json["deliveryDate"] == null
            ? null
            : DateTime.tryParse(json["deliveryDate"]),
        slotId: json["slotId"],
        // statusEnum: statusValues.map[json["status"]],
        deliveryAddress: json["deliveryAddress"],
        notes: json["notes"],
        offerData: json["offerData"] != null
            ? OfferData.fromJson(json["offerData"])
            : null,
        metadata: json["metadata"] != null
            ? Metadata.fromJson(json["metadata"])
            : json["metadata"]?.Metadata.fromJson(json["metadata"]),
        submittedAt: json["submittedAt"],
        bufferETAMessage: json["bufferETAMessage"] ?? "",
        orderCharges: json["orderCharges"] != null
            ? List<OrderCharges>.from(
                json["orderCharges"].map((x) => OrderCharges.fromJson(x ?? {})))
            : [],
        // walletError: json["walletError"],
        // walletBalance: json["walletBalance"]?.toDouble(),
        // checkoutMessage: json["checkoutMessage"] ?? "",
        // etaMessage: json["etaMessage"] ?? "",
        // walletLoyaltyCoins: json['walletLoyaltyCoins'],
        // finalBillCoins: json['finalBillCoins'],
        // coinsReceived: json['coinsReceived'],
        // cartCoinsEarned: json['cartCoinsEarned'],
        // coinsAfterDeduction: json['coinsAfterDeduction'],
        // orderCount: json['orderCount'],
        // cartImages: json['cartImages'],
        // isRefunded: json['isRefunded'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customerId": customerId,
        "displayOrderId": displayOrderId,
        "storeId": storeId,
        "slotId": slotId,
        "storeName": storeName,
        "quantity": quantity,
        "deliveryDate": deliveryDate,
        "totalMrpGrossAmount": totalMrpGrossAmount,
        "totalSpGrossAmount": totalSpGrossAmount,
        "totalDiscountAmount": totalDiscountAmount,
        "totalTaxAmount": totalTaxAmount,
        "totalExtraFeeAmount": totalExtraFeeAmount,
        "refundAmount": refundAmount,
        "finalBillAmount": finalBillAmount,
        "estimatedBillAmount": estimatedBillAmount,
        "amountReceived": amountReceived,
        "totalAdditionalDiscount": totalAdditionalDiscount?.toJson(),
        "extraFeeDetails": extraFeeDetails?.toJson(),
        "itemCount": itemCount,
        "channel": channel,
        "shippingMethod": shippingMethod,
        "paymentMethod": paymentMethod,
        "orderItems": List<dynamic>.from(orderItems!.map((x) => x.toJson())),
        // "refundOrders": List<dynamic>.from(refundOrders!.map((x) => x.toMap())),
        "status": status,
        // "statusEnum": statusValues.reverse[statusEnum],
        "deliveryAddress": deliveryAddress,
        "notes": notes,
        "metadata": metadata?.toJson(),
        "submittedAt": submittedAt,
        // "orderCharges":
        // List<dynamic>.from(orderCharges!.map((x) => x.toJson())),
        "bufferETAMessage": bufferETAMessage,
        "walletError": walletError,
        "walletBalance": walletBalance,
        "checkoutMessage": checkoutMessage,
        "etaMessage": etaMessage,
        "walletLoyaltyCoins": walletLoyaltyCoins,
        "finalBillCoins": finalBillCoins,
        "coinsReceived": coinsReceived,
        "cartCoinsEarned": cartCoinsEarned,
        "coinsAfterDeduction": coinsAfterDeduction,
        "orderCount": orderCount,
        "cartImages": cartImages,
        "isRefunded": isRefunded,
        // "pageAction": ticketWindowValues.reverse[pageAction],
        "modifiedAt": modifiedAt?.toIso8601String(),
        "deliveryDate": deliveryDate?.toIso8601String(),
        // "deliveryChargesAndOffer": deliveryChargesAndOffer?.toMap(),
      };
}

class CartOrderItem {
  String? id;
  String? orderId;
  String? skuCode;
  String? productName;
  String? uom;
  String? imageUrl;
  int? categoryId;
  String? categoryName;
  num? orderedQty;
  num? finalQuantity;
  num? salePrice;
  num? markedPrice;
  num? mrpGrossAmount;
  num? spGrossAmount;
  num? discountAmount;
  // AdditionalDiscount? additionalDiscount;
  num? taxAmount;
  // TaxDetails? taxDetails;
  num? refundAmount;
  num? finalAmount;
  num? finalItemBillCoins;
  num? itemCoinsEarned;
  int? isCoinsRedeemedItem;
  int? isRefundable;
  int? isReturnable;
  String? status;
  Metadata? metadata;
  String? error;
  num? prorataAmount;

  CartOrderItem(
      {this.id,
      this.orderId,
      this.skuCode,
      this.productName,
      this.uom,
      this.imageUrl,
      this.categoryId,
      this.categoryName,
      this.orderedQty,
      this.finalQuantity,
      this.salePrice,
      this.markedPrice,
      this.mrpGrossAmount,
      this.spGrossAmount,
      this.discountAmount,
      // this.additionalDiscount,
      this.taxAmount,
      // this.taxDetails,
      this.refundAmount,
      this.finalAmount,
      this.finalItemBillCoins,
      this.itemCoinsEarned,
      this.isCoinsRedeemedItem,
      this.isRefundable,
      this.isReturnable,
      this.status,
      this.metadata,
      this.error,
      this.prorataAmount});

  CartOrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    skuCode = json['skuCode'];
    productName = json['productName'];
    uom = json['uom'];
    imageUrl = json['imageUrl'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    orderedQty = json['orderedQty'];
    finalQuantity = json['finalQuantity'];
    salePrice = json['salePrice'];
    markedPrice = json['markedPrice'];
    mrpGrossAmount = json['mrpGrossAmount'];
    spGrossAmount = json['spGrossAmount'];
    discountAmount = json['discountAmount'];
    // additionalDiscount = json['additionalDiscount'] != null
    //     ? new AdditionalDiscount.fromJson(json['additionalDiscount'])
    //     : null;
    taxAmount = json['taxAmount'];
    // taxDetails = json['taxDetails'] != null
    //     ? new TaxDetails.fromJson(json['taxDetails'])
    //     : null;
    refundAmount = json['refundAmount'];
    finalAmount = json['finalAmount'];
    finalItemBillCoins = json['finalItemBillCoins'];
    itemCoinsEarned = json['itemCoinsEarned'];
    isCoinsRedeemedItem = json['isCoinsRedeemedItem'];
    isRefundable = json['isRefundable'];
    isReturnable = json['isReturnable'];
    status = json['status'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    // error = json['error'];
    prorataAmount = json['prorataAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['orderId'] = orderId;
    data['skuCode'] = skuCode;
    data['productName'] = productName;
    data['uom'] = uom;
    data['imageUrl'] = imageUrl;
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['orderedQty'] = orderedQty;
    data['finalQuantity'] = finalQuantity;
    // data['salePrice'] = salePrice;
    // data['markedPrice'] = markedPrice;
    // // data['mrpGrossAmount'] = mrpGrossAmount;
    // // data['spGrossAmount'] = spGrossAmount;
    // // data['discountAmount'] = discountAmount;
    // // // if (additionalDiscount != null) {
    // // //   data['additionalDiscount'] = additionalDiscount!.toJson();
    // // // }
    // // data['taxAmount'] = taxAmount;
    // // // if (taxDetails != null) {
    // // //   data['taxDetails'] = taxDetails!.toJson();
    // // // }
    // // data['refundAmount'] = refundAmount;
    // // data['finalAmount'] = finalAmount;
    // // data['finalItemBillCoins'] = finalItemBillCoins;
    // // data['itemCoinsEarned'] = itemCoinsEarned;
    // // data['isCoinsRedeemedItem'] = isCoinsRedeemedItem;
    // // data['isRefundable'] = isRefundable;
    // // data['isReturnable'] = isReturnable;
    // // data['status'] = status;
    // // // if (metadata != null) {
    // // //   data['metadata'] = metadata!.toJson();
    // // // }
    // // data['error'] = error;
    // // data['prorataAmount'] = prorataAmount;
    return data;
  }
}

class Metadata {
  String? productName;
  int? pieces;
  String? suffix;
  String? notes;
  double? perPiecesWeight;
  List<Grade>? grades;

  Metadata(
      {this.productName,
      this.pieces,
      this.suffix,
      this.notes,
      this.perPiecesWeight,
      this.grades,
      });

  Metadata.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    pieces = json['pieces'];
    suffix = json['suffix'];
    notes = json['notes'];
    perPiecesWeight = json['perPiecesWeight'];
    grades = List.from(json['grades'] ?? [])
        .map(
          (e) => Grade.fromJson(e),
        )
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productName'] = productName;
    data['pieces'] = pieces;
    data['suffix'] = suffix;
    data['notes'] = notes;
    data['perPiecesWeight'] = perPiecesWeight;
    data['grades'] = grades;
    return data;
  }
}

class OrderCharges {
  String? name;
  double? amount;

  OrderCharges({this.name, this.amount});

  OrderCharges.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['amount'] = this.amount;
    return data;
  }
}

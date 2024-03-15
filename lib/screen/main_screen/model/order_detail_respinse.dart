class OrderDetailResponseModel {
  OrderDetailResponseModel({
    this.createdAt,
    this.createdBy,
    this.modifiedAt,
    this.modifiedBy,
    this.id,
    this.customerId,
    this.displayOrderId,
    this.storeId,
    this.finalBillAmount,
    this.estimatedBillAmount,
    this.amountReceived,
    this.itemCount,
    this.shippingMethod,
    this.paymentMethod,
    this.status,
    this.paymentDetail,
    this.deliveryAddress,
    this.submittedAt,
    this.totalMrpGrossAmount,
    this.totalSpGrossAmount,
    this.totalDiscountAmount,
    this.totalTaxAmount,
    this.totalExtraFeeAmount,
    this.refundAmount,
    this.taxDetails,
    this.totalAdditionalDiscount,
    this.extraFeeDetails,
    this.channel,
    this.orderItems,
    this.orderCharges,
    this.notes,
    this.offerData,
    // this.metadata,
  });

  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? modifiedAt;
  final String? modifiedBy;
  final String? id;
  final String? customerId;
  final String? displayOrderId;
  final String? storeId;
  final num? finalBillAmount;
  final num? estimatedBillAmount;
  final num? amountReceived;
  final num? itemCount;
  final String? shippingMethod;
  final String? paymentMethod;
  final String? status;
  final PaymentDetail? paymentDetail;
  final num? deliveryAddress;
  final String? submittedAt;
  final num? totalMrpGrossAmount;
  final num? totalSpGrossAmount;
  final num? totalDiscountAmount;
  final num? totalTaxAmount;
  final num? totalExtraFeeAmount;
  final num? refundAmount;
  final Map<String, num>? taxDetails;
  final AdditionalDiscount? totalAdditionalDiscount;
  final ExtraFeeDetails? extraFeeDetails;
  final String? channel;
  final List<OrderItem?>? orderItems;
  final dynamic orderCharges;
  final String? notes;
  final OfferData? offerData;
  // final Metadata? metadata;

  factory OrderDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailResponseModel(
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : null,
        createdBy: json["createdBy"],
        modifiedAt: DateTime.parse(json["modifiedAt"] ?? {}),
        modifiedBy: json["modifiedBy"],
        id: json["id"],
        customerId: json["customerId"],
        displayOrderId: json["displayOrderId"],
        storeId: json["storeId"],
        finalBillAmount: json["finalBillAmount"],
        estimatedBillAmount: json["estimatedBillAmount"],
        amountReceived: json["amountReceived"],
        itemCount: json["itemCount"],
        shippingMethod: json["shippingMethod"],
        paymentMethod: json["paymentMethod"],
        status: json["status"],
        paymentDetail: PaymentDetail.fromJson(json["paymentDetail"] ?? {}),
        deliveryAddress: json["deliveryAddress"],
        submittedAt: json["submittedAt"],
        totalMrpGrossAmount: json["totalMrpGrossAmount"],
        totalSpGrossAmount: json["totalSpGrossAmount"],
        totalDiscountAmount: json["totalDiscountAmount"],
        totalTaxAmount: json["totalTaxAmount"],
        totalExtraFeeAmount: json["totalExtraFeeAmount"],
        refundAmount: json["refundAmount"],
        taxDetails: Map.from(json["taxDetails"])
            .map((k, v) => MapEntry<String, num>(k, v)),
        totalAdditionalDiscount:
        AdditionalDiscount.fromJson(json["totalAdditionalDiscount"] ?? {}),
        extraFeeDetails:
        ExtraFeeDetails.fromJson(json["extraFeeDetails"] ?? {}),
        channel: json["channel"],
        orderItems: List<OrderItem>.from(
            json["orderItems"].map((x) => OrderItem.fromJson(x))),
        orderCharges: json["orderCharges"],
        notes: json["notes"],
        offerData: OfferData.fromJson(json["offerData"] ?? {}),
        // metadata: Metadata.fromJson(json["metadata"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt?.toIso8601String(),
    "createdBy": createdBy,
    "modifiedAt": modifiedAt?.toIso8601String(),
    "modifiedBy": modifiedBy,
    "id": id,
    "customerId": customerId,
    "displayOrderId": displayOrderId,
    "storeId": storeId,
    "finalBillAmount": finalBillAmount,
    "estimatedBillAmount": estimatedBillAmount,
    "amountReceived": amountReceived,
    "itemCount": itemCount,
    "shippingMethod": shippingMethod,
    "paymentMethod": paymentMethod,
    "status": status,
    "paymentDetail": paymentDetail?.toJson(),
    "deliveryAddress": deliveryAddress,
    "submittedAt": submittedAt,
    "totalMrpGrossAmount": totalMrpGrossAmount,
    "totalSpGrossAmount": totalSpGrossAmount,
    "totalDiscountAmount": totalDiscountAmount,
    "totalTaxAmount": totalTaxAmount,
    "totalExtraFeeAmount": totalExtraFeeAmount,
    "refundAmount": refundAmount,
    "taxDetails": Map.from(taxDetails ?? {})
        .map((k, v) => MapEntry<String, dynamic>(k, v)),
    "totalAdditionalDiscount": totalAdditionalDiscount?.toJson(),
    "extraFeeDetails": extraFeeDetails?.toJson(),
    "channel": channel,
    "orderItems":
    List<dynamic>.from(orderItems ?? [].map((x) => x?.toJson())),
    "orderCharges": orderCharges,
    "notes": notes,
    "offerData": offerData?.toJson(),
    // "metadata": metadata?.toJson(),
  };

  @override
  String toString() {
    return 'OrdersDetailsResponseModel(createdAt: $createdAt, createdBy: $createdBy, modifiedAt: $modifiedAt, modifiedBy: $modifiedBy, id: $id, customerId: $customerId, displayOrderId: $displayOrderId, storeId: $storeId, finalBillAmount: $finalBillAmount, estimatedBillAmount: $estimatedBillAmount, amountReceived: $amountReceived, itemCount: $itemCount, shippingMethod: $shippingMethod, paymentMethod: $paymentMethod, status: $status, paymentDetail: $paymentDetail, deliveryAddress: $deliveryAddress, submittedAt: $submittedAt, totalMrpGrossAmount: $totalMrpGrossAmount, totalSpGrossAmount: $totalSpGrossAmount, totalDiscountAmount: $totalDiscountAmount, totalTaxAmount: $totalTaxAmount, totalExtraFeeAmount: $totalExtraFeeAmount, refundAmount: $refundAmount, taxDetails: $taxDetails, totalAdditionalDiscount: $totalAdditionalDiscount, extraFeeDetails: $extraFeeDetails, channel: $channel, orderItems: $orderItems, orderCharges: $orderCharges, notes: $notes, offerData: $offerData)';
  }
}

class ExtraFeeDetails {
  ExtraFeeDetails({
    this.deliveryCharge,
    this.packingCharge,
  });

  num? deliveryCharge;
  num? packingCharge;

  factory ExtraFeeDetails.fromJson(Map<String, dynamic> json) =>
      ExtraFeeDetails(
        deliveryCharge: json["deliveryCharge"],
        packingCharge: json["packingCharge"],
      );

  Map<String, dynamic> toJson() => {
    "deliveryCharge": deliveryCharge,
    "packingCharge": packingCharge,
  };
}

class Metadata {
  Metadata({
    this.location,
    this.contactDetail,
    this.eta,
    this.productMetadata,
    this.calories,
    this.categoryCount,
  });

  Location? location;
  ContactDetail? contactDetail;
  Eta? eta;
  List<ProductMetadatum?>? productMetadata;
  num? calories;
  CategoryCount? categoryCount;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    location: Location.fromJson(json["location"] ?? {}),
    contactDetail: ContactDetail.fromJson(json["contactDetail"] ?? {}),
    eta: Eta.fromJson(json["eta"] ?? {}),
    productMetadata: List<ProductMetadatum>.from(
        json["productMetadata"].map((x) => ProductMetadatum.fromJson(x))),
    calories: json["calories"],
    categoryCount: CategoryCount.fromJson(json["categoryCount"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "contactDetail": contactDetail?.toJson(),
    "eta": eta?.toJson(),
    "productMetadata":
    List<dynamic>.from(productMetadata ?? [].map((x) => x?.toJson())),
    "calories": calories,
    "categoryCount": categoryCount?.toJson(),
  };
}

class CategoryCount {
  CategoryCount({
    this.fruits,
  });

  num? fruits;

  factory CategoryCount.fromJson(Map<String, dynamic> json) => CategoryCount(
    fruits: json["Fruits"],
  );

  Map<String, dynamic> toJson() => {
    "Fruits": fruits,
  };
}

class ContactDetail {
  ContactDetail({
    this.name,
    this.phone,
  });

  String? name;
  String? phone;

  factory ContactDetail.fromJson(Map<String, dynamic> json) => ContactDetail(
    name: json["name"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "phone": phone,
  };
}

class Eta {
  Eta({
    this.maxEta,
    this.minEta,
    this.actualEta,
  });

  num? maxEta;
  num? minEta;
  num? actualEta;

  factory Eta.fromJson(Map<String, dynamic> json) => Eta(
    maxEta: json["maxEta"],
    minEta: json["minEta"],
    actualEta: json["actualEta"],
  );

  Map<String, dynamic> toJson() => {
    "maxEta": maxEta,
    "minEta": minEta,
    "actualEta": actualEta,
  };
}

class Location {
  Location({
    this.lat,
    this.long,
  });

  String? lat;
  String? long;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    lat: json["lat"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "long": long,
  };
}

class ProductMetadatum {
  ProductMetadatum({
    this.value,
    this.name,
  });

  double? value;
  String? name;

  factory ProductMetadatum.fromJson(Map<String, dynamic> json) =>
      ProductMetadatum(
        value: json["value"].toDouble(),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
    "value": value,
    "name": name,
  };
}

class OfferData {
  OfferData({
    this.offerId,
    this.voucherCode,
    this.isOfferApplied,
    this.offerTerms,
    this.offerStart,
    this.offerEnd,
  });

  dynamic offerId;
  dynamic voucherCode;
  bool? isOfferApplied;
  dynamic offerTerms;
  dynamic offerStart;
  dynamic offerEnd;

  factory OfferData.fromJson(Map<String, dynamic> json) => OfferData(
    offerId: json["offerId"],
    voucherCode: json["voucherCode"],
    isOfferApplied: json["isOfferApplied"],
    offerTerms: json["offerTerms"],
    offerStart: json["offerStart"],
    offerEnd: json["offerEnd"],
  );

  Map<String, dynamic> toJson() => {
    "offerId": offerId,
    "voucherCode": voucherCode,
    "isOfferApplied": isOfferApplied,
    "offerTerms": offerTerms,
    "offerStart": offerStart,
    "offerEnd": offerEnd,
  };
}

class OrderItem {
  OrderItem({
    this.id,
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
    this.additionalDiscount,
    this.taxAmount,
    this.taxDetails,
    this.refundAmount,
    this.finalAmount,
    this.isRefundable,
    this.isReturnable,
    this.status,
    this.error,
    this.prorataAmount,
    this.moq,
    this.whId,
    this.refundDetails,
  });

  String? id;
  String? orderId;
  RefundDetails? refundDetails;
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
  AdditionalDiscount? additionalDiscount;
  num? taxAmount;
  Map<String, num>? taxDetails;
  dynamic refundAmount;
  num? finalAmount;
  num? isRefundable;
  num? isReturnable;
  String? status;
  dynamic error;
  dynamic prorataAmount;
  num? refundQty;
  double? moq;
  double? whId;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    id: json["id"],
    orderId: json["orderId"],
    skuCode: json["skuCode"],
    productName: json["productName"],
    uom: json["uom"],
    imageUrl: json["imageUrl"],
    categoryId: json["categoryId"],
    categoryName: json["categoryName"],
    orderedQty: json["orderedQty"],
    finalQuantity: json["finalQuantity"],
    salePrice: json["salePrice"],
    markedPrice: json["markedPrice"] ?? 999,
    mrpGrossAmount: json["mrpGrossAmount"],
    spGrossAmount: json["spGrossAmount"],
    discountAmount: json["discountAmount"],
    additionalDiscount:
    AdditionalDiscount.fromJson(json["additionalDiscount"] ?? {}),
    taxAmount: json["taxAmount"],
    taxDetails: json["taxDetails"] != null
        ? Map.from(json["taxDetails"] ?? {})
        .map((k, v) => MapEntry<String, num>(k, v))
        : null,
    refundAmount: json["refundAmount"],
    finalAmount: json["finalAmount"],
    isRefundable: json["isRefundable"],
    isReturnable: json["isReturnable"],
    status: json["status"],
    error: json["error"],
    prorataAmount: json['prorataAmount'] ?? 0,
    whId:
    json['whId'] != null ? double.parse(json['whId'].toString()) : null,
    moq: json['moq'] != null ? double.parse(json['moq'].toString()) : null,
    refundDetails: RefundDetails.fromJson(json['refundDetails'] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderId": orderId,
    "skuCode": skuCode,
    "productName": productName,
    "uom": uom,
    "imageUrl": imageUrl,
    "categoryId": categoryId,
    "categoryName": categoryName,
    "orderedQty": orderedQty,
    "finalQuantity": finalQuantity,
    "salePrice": salePrice,
    "markedPrice": markedPrice,
    "mrpGrossAmount": mrpGrossAmount,
    "spGrossAmount": spGrossAmount,
    "discountAmount": discountAmount,
    "additionalDiscount": additionalDiscount?.toJson(),
    "taxAmount": taxAmount,
    "taxDetails": Map.from(taxDetails ?? {})
        .map((k, v) => MapEntry<String, dynamic>(k, v)),
    "refundAmount": refundAmount,
    "finalAmount": finalAmount,
    "isRefundable": isRefundable,
    "isReturnable": isReturnable,
    "status": status,
    "error": error,
    "prorataAmount": prorataAmount,
    'moq': moq,
    'whId': whId
  };
}

class AdditionalDiscount {
  AdditionalDiscount({
    this.offerDiscount,
  });

  dynamic offerDiscount;

  factory AdditionalDiscount.fromJson(Map<String, dynamic> json) =>
      AdditionalDiscount(
        offerDiscount: json["offerDiscount"],
      );

  Map<String, dynamic> toJson() => {
    "offerDiscount": offerDiscount,
  };
}

class PaymentDetail {
  PaymentDetail({
    this.paymentStatus,
    this.transactions,
  });

  String? paymentStatus;
  dynamic transactions;

  factory PaymentDetail.fromJson(Map<String, dynamic> json) => PaymentDetail(
    paymentStatus: json["paymentStatus"],
    transactions: json["transactions"],
  );

  Map<String, dynamic> toJson() => {
    "paymentStatus": paymentStatus,
    "transactions": transactions,
  };
}

class RefundDetails {
  String? remarks;
  bool? warehouseReturnCheck;
  String? requestedBy;
  String? approvedBy;

  RefundDetails(
      {this.remarks,
        this.warehouseReturnCheck,
        this.requestedBy,
        this.approvedBy});

  RefundDetails.fromJson(Map<String, dynamic> json) {
    remarks = json['remarks'];
    warehouseReturnCheck = json['warehouseReturnCheck'];
    requestedBy = json['requestedBy'];
    approvedBy = json['approvedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remarks'] = this.remarks;
    data['warehouseReturnCheck'] = this.warehouseReturnCheck;
    data['requestedBy'] = this.requestedBy;
    data['approvedBy'] = this.approvedBy;
    return data;
  }
}

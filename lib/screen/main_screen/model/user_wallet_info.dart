class WalletResponse {
  String? entityId;
  String? entityType;
  double? amount;
  int? loyaltyCoins;
  double? walletHold;
  int? creditLimit;
  String? status;
  Metadata? metadata;

  WalletResponse(
      {this.entityId,
        this.entityType,
        this.amount,
        this.loyaltyCoins,
        this.walletHold,
        this.creditLimit,
        this.status,
        this.metadata});

  WalletResponse.fromJson(Map<String, dynamic> json) {
    entityId = json['entityId'];
    entityType = json['entityType'];
    amount = json['amount'];
    loyaltyCoins = json['loyaltyCoins'];
    walletHold = json['walletHold'];
    creditLimit = json['creditLimit'];
    status = json['status'];
    metadata = json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['entityId'] = entityId;
    data['entityType'] = entityType;
    data['amount'] = amount;
    data['loyaltyCoins'] = loyaltyCoins;
    data['walletHold'] = walletHold;
    data['creditLimit'] = creditLimit;
    data['status'] = status;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    return data;
  }
}

class Metadata {
  int? lastOrderCost;
  int? lastOrderRefund;
  int? afterOrderTopup;
  int? walletAdjustment;
  int? minOutstanding;
  int? windowOutstanding;

  Metadata(
      {this.lastOrderCost,
        this.lastOrderRefund,
        this.afterOrderTopup,
        this.walletAdjustment,
        this.minOutstanding,
        this.windowOutstanding});

  Metadata.fromJson(Map<String, dynamic> json) {
    lastOrderCost = json['lastOrderCost'];
    lastOrderRefund = json['lastOrderRefund'];
    afterOrderTopup = json['afterOrderTopup'];
    walletAdjustment = json['walletAdjustment'];
    minOutstanding = json['minOutstanding'];
    windowOutstanding = json['windowOutstanding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lastOrderCost'] = lastOrderCost;
    data['lastOrderRefund'] = lastOrderRefund;
    data['afterOrderTopup'] = afterOrderTopup;
    data['walletAdjustment'] = walletAdjustment;
    data['minOutstanding'] = minOutstanding;
    data['windowOutstanding'] = windowOutstanding;
    return data;
  }
}

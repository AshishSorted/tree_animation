import 'dart:convert';

import 'package:equatable/equatable.dart';

class OrderListingResponseModel extends Equatable {
  final String? createdAt;
  final String? createdBy;
  final String? modifiedAt;
  final String? modifiedBy;
  final String? id;
  final String? displayOrderId;
  final String? storeId;
  final num? finalBillAmount;
  final num? estimatedBillAmount;
  final num? amountReceived;
  final num? itemCount;
  final String? shippingMethod;
  final String? paymentMethod;
  final String? status;
  final int? deliveryAddress;
  final String? submittedAt;
  const OrderListingResponseModel({
    this.createdAt,
    this.createdBy,
    this.modifiedAt,
    this.modifiedBy,
    this.id,
    this.displayOrderId,
    this.storeId,
    this.finalBillAmount,
    this.estimatedBillAmount,
    this.amountReceived,
    this.itemCount,
    this.shippingMethod,
    this.paymentMethod,
    this.status,
    this.deliveryAddress,
    this.submittedAt,
  });

  OrderListingResponseModel copyWith({
    String? createdAt,
    String? createdBy,
    String? modifiedAt,
    String? modifiedBy,
    String? id,
    String? displayOrderId,
    String? storeId,
    num? finalBillAmount,
    num? estimatedBillAmount,
    num? amountReceived,
    num? itemCount,
    String? shippingMethod,
    String? paymentMethod,
    String? status,
    int? deliveryAddress,
    String? submittedAt,
  }) {
    return OrderListingResponseModel(
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      id: id ?? this.id,
      displayOrderId: displayOrderId ?? this.displayOrderId,
      storeId: storeId ?? this.storeId,
      finalBillAmount: finalBillAmount ?? this.finalBillAmount,
      estimatedBillAmount: estimatedBillAmount ?? this.estimatedBillAmount,
      amountReceived: amountReceived ?? this.amountReceived,
      itemCount: itemCount ?? this.itemCount,
      shippingMethod: shippingMethod ?? this.shippingMethod,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      submittedAt: submittedAt ?? this.submittedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'createdBy': createdBy,
      'modifiedAt': modifiedAt,
      'modifiedBy': modifiedBy,
      'id': id,
      'displayOrderId': displayOrderId,
      'storeId': storeId,
      'finalBillAmount': finalBillAmount,
      'estimatedBillAmount': estimatedBillAmount,
      'amountReceived': amountReceived,
      'itemCount': itemCount,
      'shippingMethod': shippingMethod,
      'paymentMethod': paymentMethod,
      'status': status,
      'deliveryAddress': deliveryAddress,
      'submittedAt': submittedAt,
    };
  }

  factory OrderListingResponseModel.fromMap(Map<String, dynamic> map) {
    return OrderListingResponseModel(
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      createdBy: map['createdBy'] != null ? map['createdBy'] as String : null,
      modifiedAt:
      map['modifiedAt'] != null ? map['modifiedAt'] as String : null,
      modifiedBy:
      map['modifiedBy'] != null ? map['modifiedBy'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      displayOrderId: map['displayOrderId'] != null
          ? map['displayOrderId'] as String
          : null,
      storeId: map['storeId'] != null ? map['storeId'] as String : null,
      finalBillAmount:
      map['finalBillAmount'] != null ? map['finalBillAmount'] as num : null,
      estimatedBillAmount: map['estimatedBillAmount'] != null
          ? map['estimatedBillAmount'] as num
          : null,
      amountReceived:
      map['amountReceived'] != null ? map['amountReceived'] as num : null,
      itemCount: map['itemCount'] != null ? map['itemCount'] as num : null,
      shippingMethod: map['shippingMethod'] != null
          ? map['shippingMethod'] as String
          : null,
      paymentMethod:
      map['paymentMethod'] != null ? map['paymentMethod'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      deliveryAddress:
      map['deliveryAddress'] != null ? map['deliveryAddress'] as int : null,
      submittedAt:
      map['submittedAt'] != null ? map['submittedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderListingResponseModel.fromJson(String source) =>
      OrderListingResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      createdAt,
      createdBy,
      modifiedAt,
      modifiedBy,
      id,
      displayOrderId,
      storeId,
      finalBillAmount,
      estimatedBillAmount,
      amountReceived,
      itemCount,
      shippingMethod,
      paymentMethod,
      status,
      deliveryAddress,
      submittedAt,
    ];
  }
}

enum OrderStatus {
  inCart,
  newOrder,
  orderAcceptedByStore,
  orderCancelledByStore,
  orderBilled,
  orderCancelledByCustomer,
  readyForPickup,
  orderOutForDelivery,
  orderDelivered,
  orderRefunded,
}

// extension OrderStatusValueInt on OrderStatus {
//   int get value {
//     switch (this) {
//       case OrderStatus.inCart:
//         return 0;

//       case OrderStatus.newOrder:
//         return 1;

//       case OrderStatus.orderAcceptedByStore:
//         return 2;

//       case OrderStatus.orderCancelledByStore:
//         return 3;

//       case OrderStatus.orderBilled:
//         return 4;

//       case OrderStatus.orderCancelledByCustomer:
//         return 5;

//       case OrderStatus.readyForPickup:
//         return 6;

//       case OrderStatus.orderOutForDelivery:
//         return 7;

//       case OrderStatus.orderDelivered:
//         return 8;

//       case OrderStatus.orderRefunded:
//         return 9;

//       default:
//         return -1;
//     }
//   }
// }

extension OrderStatusValueString on OrderStatus {
  String get value {
    switch (this) {
      case OrderStatus.inCart:
        return 'IN_CART';

      case OrderStatus.newOrder:
        return 'NEW_ORDER';

      case OrderStatus.orderAcceptedByStore:
        return 'ORDER_ACCEPTED_BY_STORE';

      case OrderStatus.orderCancelledByStore:
        return 'ORDER_CANCELLED_BY_STORE';

      case OrderStatus.orderBilled:
        return 'ORDER_BILLED';

      case OrderStatus.orderCancelledByCustomer:
        return 'ORDER_CANCELLED_BY_CUSTOMER';

      case OrderStatus.readyForPickup:
        return 'READY_FOR_PICKUP';

      case OrderStatus.orderOutForDelivery:
        return 'ORDER_OUT_FOR_DELIVERY';

      case OrderStatus.orderDelivered:
        return 'ORDER_DELIVERED';

      case OrderStatus.orderRefunded:
        return 'ORDER_REFUNDED';

      default:
        return '';
    }
  }
}

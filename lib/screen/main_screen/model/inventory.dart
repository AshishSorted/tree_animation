import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'cart_response_model.dart';
import 'product.dart';

class InventoryResponseModel extends Equatable {
  final String? id;
  final num? quantity;
  final num? marketPrice;
  final num? salePrice;
  final String? procurementCategory;
  final num? moq;
  final String? skuCode;
  final String? notes;
  final bool? isActive;
  final List<PriceBracket>? priceBrackets;
  final ProductResponseModel? product;
  final String? storeId;
  // final StoreResponseModel? store;
  final String? createdAt;
  final String? updatedAt;
  final String? updatedBy;
  final num? finalAmount;
  final List<Grade>? grades;
  final bool editing;
  final String? synonyms;
  final RxDouble selectedQuantity = 0.0.obs;
  final RxString notesValue = "".obs;
  final RxBool enablePiecesRequest = false.obs;
  final int? pieces;

  InventoryResponseModel({
    this.id,
    this.quantity,
    this.isActive,
    this.marketPrice,
    this.skuCode,
    this.notes,
    this.priceBrackets,
    this.product,
    this.storeId,
    this.salePrice,
    this.finalAmount,
    // this.store,
    this.createdAt,
    this.updatedAt,
    this.updatedBy,
    this.procurementCategory,
    this.moq,
    this.grades,
    this.editing = false,
    this.synonyms,
    this.pieces,
    // this.selectedQuantity,
  });

  InventoryResponseModel copyWith({
    String? id,
    num? quantity,
    num? marketPrice,
    num? salePrice,
    num? finalAmount,
    String? skuCode,
    bool? isActive,
    List<PriceBracket>? priceBrackets,
    ProductResponseModel? product,
    String? storeId,
    // StoreResponseModel? store,
    String? createdAt,
    String? notes,
    String? updatedAt,
    String? updatedBy,
    String? procurementCategory,
    num? moq,
    List<Grade>? grades,
    bool? editing,
    String? synonyms,
    int? pieces,
  }) {
    return InventoryResponseModel(
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      notes: notes ?? this.notes,
      quantity: quantity ?? this.quantity,
      marketPrice: marketPrice ?? this.marketPrice,
      salePrice: salePrice ?? this.salePrice,
      finalAmount: finalAmount ?? this.finalAmount,
      skuCode: skuCode ?? this.skuCode,
      priceBrackets: priceBrackets ?? this.priceBrackets,
      product: product ?? this.product,
      storeId: storeId ?? this.storeId,
      // store: store ?? this.store,
      moq: moq ?? this.moq,
      procurementCategory: procurementCategory ?? this.procurementCategory,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      updatedBy: updatedBy ?? this.updatedBy,
      grades: grades ?? this.grades,
      editing: editing ?? this.editing,
      synonyms: synonyms ?? this.synonyms,
      pieces: pieces ?? this.pieces,
    );
  }

  double get salePriceBasedOnQty {
    // if (priceBucket != null) {
    //   for (PriceBucket item in priceBucket!) {
    //     if (selectedQuantity >= item.min! && selectedQuantity <= item.max!) {
    //       return item.salePrice!;
    //     }
    //   }
    // }
    if (product!.enablePiecesRequest! &&
        salePrice != null &&
        product!.perPcsWeight != null) {
      return (salePrice! * product!.perPcsWeight!).toDouble();
    } else {
      return salePrice?.toDouble() ?? 0.0;
    }
  }

  double get salePriceBasedOnQtyReal {
    return salePrice?.toDouble() ?? 0.0;
  }

  List<PriceBracket> get getPriceBucket {
    // List<PriceBucket> list = priceBucket ?? [];
    // if (list.isNotEmpty) {
    //   list.removeAt(0);
    // }
    return priceBrackets ?? [];
  }

  double? get salePriceBasedOnSelectedQty {
    if ((priceBrackets ?? []).isNotEmpty) {
      num price = salePrice ?? 0.0;
      for (PriceBracket priceBracket in priceBrackets ?? []) {
        if (selectedQuantity.value >= (priceBracket.min ?? 0) &&
            selectedQuantity.value < (priceBracket.max ?? 0)) {
          price = priceBracket.salePrice ?? 0;
        }
      }
      return price.toDouble();
    } else {
      return salePrice?.toDouble() ?? 0.0;
    }
  }

  int get servingCount {
    return selectedQuantity.value ~/ (product!.serves1!);
  }

  double get steps {
    if (product!.enablePiecesRequest!) {
      return 1.0;
    } else if (product!.unitOfMeasurement! == "KILOGRAM") {
      return 0.1;
    } else {
      return 1.0;
    }
  }

  double get minimumQty {
    if (product!.enablePiecesRequest! && product!.perPcsWeight != null) {
      int minQty = product!.minQuantity! ~/ product!.perPcsWeight!;
      return minQty.toDouble();
    } else {
      return product!.minQuantity!.toDouble();
    }
  }

  // double get getItemCoinsEarned {
  //   return actualPrice * (coinsGivenRatio ?? 0);
  // }

  // double getOTPActualPrice() {
  //   return (selectedQuantity.value) * (coinsPrice ?? 0);
  // }

  double get maxQty {
    if (product!.enablePiecesRequest! && product!.perPcsWeight != null) {
      int maxQty = product!.maxQuantity! ~/ product!.perPcsWeight!;
      return maxQty.toDouble();
    } else {
      return product!.maxQuantity!.toDouble();
    }
  }

  String get unitOfMeasurement {
    if (product?.enablePiecesRequest == true) {
      return suffixReal;
    } else if (product!.unitOfMeasurement == "KILOGRAM") {
      return "kg";
    } else if (product!.unitOfMeasurement == "PACKET") {
      return "pack";
    } else if (product!.unitOfMeasurement == "BUNDLE") {
      return "bunch";
    } else {
      return "pcs";
    }
  }

  String get unitOfMeasurementFinal {
    if (enablePiecesRequest.value == true) {
      return suffixReal;
    } else if (product!.unitOfMeasurement == "KILOGRAM") {
      return "kg";
    } else if (product!.unitOfMeasurement == "PACKET") {
      return "pack";
    } else if (product!.unitOfMeasurement == "BUNDLE") {
      return "bunch";
    } else {
      return "pcs";
    }
  }

  String unitOfMeasurementForTextField(String quantity) {
    if (product?.enablePiecesRequest == true) {
      if (suffixReal == "pcs") {
        if (quantity == "1") {
          return "pc";
        }
        return "pcs";
      }
      return suffixReal;
    } else if (product!.unitOfMeasurement == "KILOGRAM") {
      return "kg";
    } else if (product!.unitOfMeasurement == "PACKET") {
      return "pack";
    } else if (product!.unitOfMeasurement == "BUNDLE") {
      return "bunch";
    } else {
      if (quantity == "1") {
        return "pc";
      }
      return "pcs";
    }
  }

  String get unitOfMeasurementReal {
    if (product!.unitOfMeasurement! == "KILOGRAM") {
      return "kg";
    } else if (product!.unitOfMeasurement! == "PACKET") {
      return "pack";
    } else if (product!.unitOfMeasurement! == "BUNDLE") {
      return "bunch";
    } else {
      return "pcs";
    }
  }

  String get suffix {
    if (product!.enablePiecesRequest!) {
      return unitOfMeasurementReal;
    } else if (product!.perPcsSuffix != null) {
      if (product!.perPcsSuffix! == "KILOGRAM") {
        return "kg";
      } else if (product!.perPcsSuffix! == "PACKET") {
        return "pack";
      } else if (product!.perPcsSuffix! == "BUNDLE") {
        return "bunch";
      } else {
        return "pcs";
      }
    }
    return '';
  }

  String get suffixFinal {
    if (enablePiecesRequest.value) {
      return unitOfMeasurementReal;
    } else if (product!.perPcsSuffix != null) {
      if (product!.perPcsSuffix! == "KILOGRAM") {
        return "kg";
      } else if (product!.perPcsSuffix! == "PACKET") {
        return "pack";
      } else if (product!.perPcsSuffix! == "BUNDLE") {
        return "bunch";
      } else {
        return "pcs";
      }
    }
    return '';
  }

  String get suffixReal {
    if (product!.perPcsSuffix != null) {
      if (product!.perPcsSuffix! == "KILOGRAM") {
        return "kg";
      } else if (product!.perPcsSuffix! == "PACKET") {
        return "pack";
      } else if (product!.perPcsSuffix! == "BUNDLE") {
        return "bunch";
      } else {
        return "pcs";
      }
    } else {
      return '';
    }
  }

  List<double> get priceBreakPoint {
    List<double> list = [];
    for (PriceBracket item in priceBrackets!) {
      list.add(item.min!.toDouble());
    }
    return list;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'is_active': isActive,
      'quantity': quantity,
      'market_price': marketPrice,
      'sale_price': salePrice,
      'sku_code': skuCode,
      'notes': notes == "" ? null : notes,
      'price_brackets': priceBrackets?.map((x) => x.toMap()).toList(),
      'product': product?.toMap(),
      'store_id': storeId,
      // 'store': store?.toMap(),
      'created_at': createdAt,
      'updated_at': updatedAt,
      'updated_by': updatedBy,
      'moq': procurementCategory,
      'procurement_category': procurementCategory,
      'grades': grades?.map((e) => e.toJson()).toList(),
      "synonyms": synonyms,
    };
  }

  factory InventoryResponseModel.fromMap(Map<String, dynamic> map) {
    return InventoryResponseModel(
      id: map['id'] != null ? map['id'] as String : null,
      notes: map['notes'] != null ? map['notes'] as String : null,
      isActive: map['is_active'] != null ? map['is_active'] as bool : null,
      quantity: map['quantity'] != null ? map['quantity'] as num : null,
      marketPrice:
      map['market_price'] != null ? map['market_price'] as num : null,
      salePrice: map['sale_price'] != null ? map['sale_price'] as num : null,
      moq: map['moq'] != null ? map['moq'] as num : null,
      skuCode: map['sku_code'] != null ? map['sku_code'] as String : null,
      procurementCategory: map['procurement_category'] != null
          ? map['procurement_category'] as String
          : null,
      priceBrackets: map['price_brackets'] != null
          ? List<PriceBracket>.from(
        (map['price_brackets'] as List).map(
              (x) => PriceBracket.fromMap(x),
        ),
      )
          : null,
      grades: map['grades'] != null
          ? List.from(
        (map['grades'] ?? []).map(
              (x) => Grade.fromJson(x),
        ),
      )
          : null,
      product: map['product'] != null
          ? ProductResponseModel.fromMap(map['product'] as Map<String, dynamic>)
          : null,
      storeId: map['store_id'] != null ? map['store_id'] as String : null,
      // store: map['store'] != null
      //     ? StoreResponseModel.fromMap(map['store'])
      //     : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
      updatedBy: map['updated_by'] != null ? map['updated_by'] as String : null,
      synonyms: map["synonyms"],
    );
  }

  String toJson() => json.encode(toMap());

  factory InventoryResponseModel.fromJson(String source) =>
      InventoryResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InventoryResponseModel(id: $id,priceBrackets: $priceBrackets market_price: $marketPrice, sku_code: $skuCode, notes: $notes, product: $product, store_id: $storeId,  created_at: $createdAt, updated_at: $updatedAt, updated_by: $updatedBy,is_active:$isActive)';
  }

  @override
  List<Object?> get props {
    return [
      id,
      isActive,
      // quantity,
      marketPrice,
      salePrice,
      skuCode,
      priceBrackets,
      product,
      storeId,
      // store,
      notes,
      createdAt,
      updatedAt,
      updatedBy,
      editing,
      grades?.map((e) => e.toJson()).join(),
      moq,
      procurementCategory,
    ];
  }

  factory InventoryResponseModel.fromCartOrderItem(
      CartOrderItem cartOrderItem, InventoryResponseModel? originalModel) {
    return (originalModel ?? InventoryResponseModel()).copyWith(
      id: cartOrderItem.id,
      notes: cartOrderItem.metadata?.notes,
      // quantity: cartOrderItem.finalQuantity,
      salePrice: cartOrderItem.salePrice,
      finalAmount: cartOrderItem.finalAmount,
      skuCode: cartOrderItem.skuCode,
      product: originalModel?.product,
      grades: List.from(cartOrderItem.metadata?.grades ?? []),
      pieces: cartOrderItem.metadata?.pieces,
    )
      ..enablePiecesRequest.value =
      originalModel?.product?.enablePiecesRequestToggle == true
          ? cartOrderItem.metadata?.pieces != null
          ? true
          : false
          : false
      ..selectedQuantity.value =
      // originalModel?.enablePiecesRequest.value == true
      originalModel?.product?.enablePiecesRequestToggle == true &&
          cartOrderItem.metadata?.pieces != null
          ? ((cartOrderItem.finalQuantity?.toDouble() ?? 0) /
          originalModel!.product!.perPcsWeight!)
          .roundToDouble()
          : (cartOrderItem.finalQuantity?.toDouble() ?? 0).toDouble()
      ..notesValue.value = cartOrderItem.metadata?.notes ?? "";
  }
}

class PriceBracket extends Equatable {
  final num? min;
  final num? max;
  final num? salePrice;

  const PriceBracket({
    this.min,
    this.max,
    this.salePrice,
  });

  PriceBracket copyWith({
    num? min,
    num? max,
    num? salePrice,
  }) {
    return PriceBracket(
      min: min ?? this.min,
      max: max ?? this.max,
      salePrice: salePrice ?? this.salePrice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'min': min,
      'max': max,
      'sale_price': salePrice,
    };
  }

  factory PriceBracket.fromMap(Map<String, dynamic> map) {
    return PriceBracket(
      min: map['min'] != null ? map['min'] as num : null,
      max: map['max'] != null ? map['max'] as num : null,
      salePrice: map['sale_price'] != null ? map['sale_price'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PriceBracket.fromJson(String source) =>
      PriceBracket.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PriceBracket(min: $min, max: $max, sale_price: $salePrice)';

  @override
  List<Object?> get props => [min, max, salePrice];
}

class Grade {
  String? name;
  num? consumerBufferPerc;
  num? logisticBufferPerc;
  num? rtvBufferPerc;
  num? cratingBufferPerc;
  num? quantity;
  num? pieces;
  String? description;
  String? image;

  Grade({
    this.name,
    this.consumerBufferPerc,
    this.logisticBufferPerc,
    this.rtvBufferPerc,
    this.cratingBufferPerc,
    this.quantity,
    this.pieces,
    this.description,
    this.image,
  });

  Grade.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    consumerBufferPerc = json['consumerBufferPerc'];
    logisticBufferPerc = json['logisticBufferPerc'];
    rtvBufferPerc = json['rtvBufferPerc'];
    cratingBufferPerc = json['cratingBufferPerc'];
    quantity = json['quantity'];
    pieces = json['pieces'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['consumerBufferPerc'] = consumerBufferPerc;
    data['logisticBufferPerc'] = logisticBufferPerc;
    data['rtvBufferPerc'] = rtvBufferPerc;
    data['cratingBufferPerc'] = cratingBufferPerc;
    data['quantity'] = quantity;
    data['pieces'] = pieces;
    data['image'] = image;
    data['description'] = description;
    return data;
  }
}

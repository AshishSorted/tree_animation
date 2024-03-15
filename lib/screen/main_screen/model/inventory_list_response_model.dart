import 'dart:convert';
import 'dart:core';
import 'package:equatable/equatable.dart';

import 'inventory.dart';

class InventoryListResponseModel extends Equatable {
  // final StoreResponseModel? store;
  final List<InventoryResponseModel>? inventory;
  const InventoryListResponseModel({
    // this.store,
    this.inventory,
  });

  InventoryListResponseModel copyWith({
    // StoreResponseModel? store,
    List<InventoryResponseModel>? inventory,
  }) {
    return InventoryListResponseModel(
      // store: store ?? this.store,
      inventory: inventory ?? this.inventory,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'store': store?.toMap(),
      'inventory': inventory,
    };
  }

  factory InventoryListResponseModel.fromMap(Map<String, dynamic> map) {
    return InventoryListResponseModel(
      // store: map['store'] != null
      //     ? StoreResponseModel.fromMap(map['store'] ?? {})
      //     : null,
      inventory: map['inventory'] != null
          ? List<InventoryResponseModel>.from(
              ((map['inventory'] ?? []) as List).map<InventoryResponseModel?>(
                (x) =>
                    InventoryResponseModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory InventoryListResponseModel.fromJson(String source) =>
      InventoryListResponseModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [
        // store,
        inventory,
      ];
}

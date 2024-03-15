import 'dart:convert';
import 'package:equatable/equatable.dart';

class ProductResponseModel extends Equatable {
  final String? skuCode;
  final int? categoryId;
  final String? name;
  final String? imageUrl;
  final String? iconUrl;
  // final List<TagResponseModel>? tags;
  final String? unitOfMeasurement;
  final num? marketPrice;
  final num? salePrice;
  final num? markedPrice;
  final String? displayName;
  final num? maxQuantity;
  final num? minQuantity;
  final num? perpiece;
  final String? suffix;
  final num? buffer;
  final num? bufferQuantity;
  final num? serves1;
  final num? lithosRef;
  final bool? isActive;
  // final CategoryResponseModel? category;
  final String? createdAt;
  final String? updatedAt;
  final String? updatedBy;
  num? perPcsWeight;
  num? perPcsBuffer;
  String? perPcsSuffix;
  bool? enablePiecesRequest;
  bool? enablePiecesRequestToggle;
  final int? id;
  final String? packetDescription;
  final String? synonyms;
  MetaData? metaData;
  ConsumerContents? consumerContents;
  final List<String>? videos;

  ProductResponseModel({
    this.packetDescription,
    this.skuCode,
    this.categoryId,
    this.name,
    this.imageUrl,
    this.iconUrl,
    // this.tags,
    this.unitOfMeasurement,
    this.marketPrice,
    this.salePrice,
    this.markedPrice,
    this.displayName,
    this.maxQuantity,
    this.minQuantity,
    this.perpiece,
    this.suffix,
    this.buffer,
    this.isActive,
    this.bufferQuantity,
    this.serves1,
    this.lithosRef,
    // this.category,
    this.createdAt,
    this.updatedAt,
    this.updatedBy,
    this.id,
    this.synonyms,
    this.metaData,
    this.consumerContents,
    this.perPcsWeight,
    this.perPcsBuffer,
    this.perPcsSuffix,
    this.videos,
    this.enablePiecesRequest,
    this.enablePiecesRequestToggle,
  });

  ProductResponseModel copyWith({
    String? skuCode,
    int? categoryId,
    String? name,
    String? imageUrl,
    String? iconUrl,
    List<String>? videos,
    // List<TagResponseModel>? tags,
    String? unitOfMeasurement,
    num? marketPrice,
    num? salePrice,
    num? markedPrice,
    String? displayName,
    num? maxQuantity,
    num? perpiece,
    String? suffix,
    num? buffer,
    num? minQuantity,
    bool? isActive,
    String? productId,
    num? bufferQuantity,
    num? serves1,
    num? lithosRef,
    int? id,
    // CategoryResponseModel? category,
    String? createdAt,
    String? updatedAt,
    bool setPdNull = false,
    String? updatedBy,
    String? packetDescription,
    String? synonyms,
    MetaData? metaData,
    bool? enablePiecesRequest,
    ConsumerContents? consumerContents,
    bool setIconUrlNull = false,
    bool setImageUrlNull = false,
    bool setVideoUrlNull = false,
  }) {
    return ProductResponseModel(
        skuCode: skuCode ?? this.skuCode,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        imageUrl: setImageUrlNull ? null : (imageUrl ?? this.imageUrl),
        iconUrl: setIconUrlNull ? null : (iconUrl ?? this.iconUrl),
        // tags: tags ?? this.tags,
        unitOfMeasurement: unitOfMeasurement ?? this.unitOfMeasurement,
        marketPrice: marketPrice ?? this.marketPrice,
        salePrice: salePrice ?? this.salePrice,
        markedPrice: markedPrice ?? this.markedPrice,
        displayName: displayName ?? this.displayName,
        maxQuantity: maxQuantity ?? this.maxQuantity,
        perpiece: perpiece ?? this.perpiece,
        suffix: suffix ?? this.suffix,
        buffer: buffer ?? this.buffer,
        minQuantity: minQuantity ?? this.minQuantity,
        bufferQuantity: bufferQuantity ?? this.bufferQuantity,
        serves1: serves1 ?? this.serves1,
        lithosRef: serves1 ?? this.lithosRef,
        isActive: isActive ?? this.isActive,
        // category: category ?? this.category,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        packetDescription: setPdNull
            ? packetDescription
            : packetDescription ?? this.packetDescription,
        updatedBy: updatedBy ?? this.updatedBy,
        id: id ?? this.id,
        synonyms: synonyms ?? this.synonyms,
        metaData: metaData ?? this.metaData,
        enablePiecesRequest: enablePiecesRequest ?? this.enablePiecesRequest,
        enablePiecesRequestToggle:
        enablePiecesRequest ?? this.enablePiecesRequest,
        consumerContents: consumerContents ?? this.consumerContents,
        videos: setVideoUrlNull ? null : (videos ?? this.videos));
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sku_code': skuCode,
      'category_id': categoryId,
      'name': name,
      'image_url': imageUrl,
      'icon_url': iconUrl,
      // 'tags': tags?.map((x) => x.toMap()).toList() ?? [],
      'unit_of_measurement': unitOfMeasurement,
      'market_price ': marketPrice,
      'sale_price': salePrice,
      'markedPrice': markedPrice,
      'is_active': isActive,
      'display_name': displayName,
      'max_quantity': maxQuantity,
      'min_quantity': minQuantity,
      'buffer_quantity': bufferQuantity,
      'serves1': serves1,
      'lithos_ref': lithosRef,
      // 'category': category?.toMap() ?? {},
      'created_at': createdAt,
      'updated_at': updatedAt,
      'updated_by': updatedBy,
      'packet_description': packetDescription,
      'id': id,
      'synonyms': synonyms,
      'metaData': metaData,
      'consumerContents': consumerContents,
      'enablePiecesRequest': enablePiecesRequest,
      'videos': videos,
      "per_pcs_weight": perPcsWeight,
      "per_pcs_buffer": perPcsBuffer,
      "per_pcs_suffix": perPcsSuffix,
    };
  }

  factory ProductResponseModel.fromMap(Map<String, dynamic> map) {
    return ProductResponseModel(
      skuCode: map['sku_code'] != null ? map['sku_code'] as String : null,
      categoryId: map['category_id'] != null ? map['category_id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      imageUrl: map['image_url'] != null ? map['image_url'] as String : null,
      // tags: List<TagResponseModel>.from(
      //   ((map['tags'] ?? []) as List).map<TagResponseModel>(
      //         (x) => TagResponseModel.fromMap(x as Map<String, dynamic>),
      //   ),
      // ),
      unitOfMeasurement: map['unit_of_measurement'] != null
          ? map['unit_of_measurement'] as String
          : null,
      packetDescription: map['packet_description'] != null
          ? map['packet_description'] as String
          : null,
      isActive: map['is_active'] != null ? map['is_active'] as bool : null,
      marketPrice:
      map['market_price'] != null ? map['market_price'] as num : null,
      salePrice: map['sale_price'] != null ? map['sale_price'] as num : null,
      markedPrice:
      map['markedPrice'] != null ? map['markedPrice'] as num : null,
      displayName:
      map['display_name'] != null ? map['display_name'] as String : null,
      maxQuantity:
      map['max_quantity'] != null ? map['max_quantity'] as num : null,
      minQuantity:
      map['min_quantity'] != null ? map['min_quantity'] as num : null,
      bufferQuantity:
      map['buffer_quantity'] != null ? map['buffer_quantity'] as num : null,
      serves1: map['serves1'] != null ? map['serves1'] as num : null,
      // category: CategoryResponseModel.fromMap(
      //     map['category'] as Map<String, dynamic>),
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
      updatedBy: map['updated_by'] != null ? map['updated_by'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      synonyms: map['synonyms'] != null ? map['synonyms'] as String : null,
      perpiece:
      map['per_pcs_weight'] != null ? map['per_pcs_weight'] as num : null,
      suffix: map['per_pcs_suffix'] != null
          ? map['per_pcs_suffix'] as String
          : null,
      buffer:
      map['per_pcs_buffer'] != null ? map['per_pcs_buffer'] as num : null,
      iconUrl: map['icon_url'] != null ? map['icon_url'] as String : null,
      lithosRef: map['lithos_ref'] != null ? map['lithos_ref'] as num : null,
      metaData: MetaData.fromJson(map['metadata'] ?? {}),
      consumerContents:
      ConsumerContents.fromJson(map['consumer_contents'] ?? {}),
      videos: map['videos'] != null
          ? List.from(map['videos']).map((e) => e.toString()).toList()
          : null,
      perPcsWeight: map["per_pcs_weight"],
      enablePiecesRequest: false,
      enablePiecesRequestToggle: map["enablePiecesRequest"],
      perPcsBuffer: map["per_pcs_buffer"],
      perPcsSuffix: map["per_pcs_suffix"],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductResponseModel.fromJson(String source) =>
      ProductResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(skuCode: $skuCode, categoryId: $categoryId, name: $name, imageUrl: $imageUrl,is_active: $isActive, unitOfMeasurement: $unitOfMeasurement, marketPrice: $marketPrice,packet_description: $packetDescription ,salePrice: $salePrice, displayName: $displayName, maxQuantity: $maxQuantity, minQuantity: $minQuantity, bufferQuantity: $bufferQuantity, serves1: $serves1, createdAt: $createdAt, updatedAt: $updatedAt, updatedBy: $updatedBy, id: $id, lithos_ref: $lithosRef, icon_url: $iconUrl, synonyms: $synonyms)';
  }

  @override
  List<Object?> get props {
    return [
      skuCode,
      categoryId,
      isActive,
      name,
      imageUrl,
      // tags,
      unitOfMeasurement,
      marketPrice,
      salePrice,
      displayName,
      maxQuantity,
      minQuantity,
      bufferQuantity,
      serves1,
      // category,
      createdAt,
      updatedAt,
      updatedBy,
      id,
      perpiece,
      suffix,
      buffer,
      lithosRef,
      iconUrl,
      packetDescription,
      synonyms,
      videos,
      enablePiecesRequest,
      enablePiecesRequestToggle,
      perPcsBuffer,
      perPcsSuffix,
      perPcsWeight
    ];
  }
}

class MetaData {
  List<PartnerContents>? partnerContents;
  List<String>? classes;
  String? availability;

  MetaData({
    this.partnerContents,
    this.classes,
    this.availability,
  });

  MetaData.fromJson(Map<String, dynamic> json) {
    if (json['partnerContents'] != null) {
      partnerContents = <PartnerContents>[];
      json['partnerContents'].forEach((v) {
        partnerContents!.add(PartnerContents.fromJson(v));
      });
      availability = json['availability'];
      try {
        classes = <String>[];
        (json['classes'] ?? []).forEach((v) {
          classes!.add((v));
        });
      } catch (e) {
        print("Classes Generation Error: ${json}");
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (partnerContents != null) {
      data['partnerContents'] =
          partnerContents!.map((v) => v.toJson()).toList();
    }
    data["classes"] = classes ?? [];
    data["availability"] = availability;
    return data;
  }
}

class PartnerContents {
  String? name;
  String? prop;
  String? value;

  PartnerContents({this.name, this.prop, this.value});

  PartnerContents.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    prop = json['prop'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['prop'] = prop;
    data['value'] = value;
    return data;
  }
}

class ConsumerContents {
  Identifier? identifier;
  List<String>? pieCategories;

  ConsumerContents({
    this.identifier,
    this.pieCategories,
  });

  ConsumerContents.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'] != null
        ? Identifier.fromJson(json['identifier'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (identifier != null) {
      data['identifier'] = identifier!.toJson();
    }
    data['pieCategories'] = pieCategories;
    return data;
  }
}

class Identifier {
  String? name;
  String? image;

  Identifier({this.name, this.image});

  Identifier.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

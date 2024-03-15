import 'dart:convert';

SocietyModelResponse societyModelFromJson(String str) =>
    SocietyModelResponse.fromJson(json.decode(str));

String societyModelToJson(SocietyModelResponse data) =>
    json.encode(data.toJson());

class SocietyModelResponse {
  List<SocietyModel>? data;

  SocietyModelResponse({
    this.data,
  });

  factory SocietyModelResponse.fromJson(Map<String, dynamic> json) =>
      SocietyModelResponse(
        data: json["data"] == null
            ? []
            : List<SocietyModel>.from(
            json["data"]!.map((x) => SocietyModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SocietyModel {
  int? id;
  String? name;
  num? latitude;
  num? longitude;
  List<Tower>? tower;
  String? storeId;
  String? pincode;
  String? city;
  String? state;

  SocietyModel(
      {this.id,
        this.name,
        this.latitude,
        this.longitude,
        this.tower,
        this.storeId,
        this.pincode,
        this.city,
        this.state});

  SocietyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['tower'] != null) {
      tower = <Tower>[];
      json['tower'].forEach((v) {
        tower!.add(Tower.fromJson(v));
      });
    }
    storeId = json['storeId'];
    pincode = json['pincode'];
    city = json['city'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (tower != null) {
      data['tower'] = tower!.map((v) => v.toJson()).toList();
    }
    data['storeId'] = storeId;
    data['pincode'] = pincode;
    data['city'] = city;
    data['state'] = state;
    return data;
  }
}

class Tower {
  String? towerName;
  int? floorCount;
  num? deliverySequence;

  Tower({this.towerName, this.floorCount, this.deliverySequence});

  Tower.fromJson(Map<String, dynamic> json) {
    towerName = json['towerName'];
    floorCount = json['floorCount'];
    deliverySequence = json['deliverySequence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['towerName'] = towerName;
    data['floorCount'] = floorCount;
    data['deliverySequence'] = deliverySequence;
    return data;
  }
}


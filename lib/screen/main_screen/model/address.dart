// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String? name;
  final String? userid;
  // final int? lithosref;
  final String? addressline_1;
  final String? addressline_2;
  final String? landmark;
  final String? street;
  final String? tower;
  final String? house;
  final String? city;
  final String? sector;
  final String? floor;
  final String? society;
  final num? societyId;
  final String? state;
  final String? type;
  final num? pincode;
  final String? contactnumber;
  final num? lat;
  final num? long;
  final num? id;
  final bool? is_active;
  const Address({
    this.name,
    this.userid,
    // this.lithosref,
    this.addressline_1,
    this.addressline_2,
    this.landmark,
    this.type,
    this.city,
    this.tower,
    this.sector,
    this.floor,
    this.society,
    this.societyId,
    this.state,
    this.pincode,
    this.id,
    this.contactnumber,
    this.lat,
    this.street,
    this.house,
    this.long,
    this.is_active,
  });

  Address copyWith({
    String? name,
    String? userid,
    // int? lithosref,
    String? addressline_1,
    String? addressline_2,
    String? landmark,
    String? city,
    String?floor,
    String?society,
    num?societyId,
    String? street,
    String? tower,
    String? sector,
    String? house,
    String? state,
    String? type,
    num? pincode,
    num? id,
    String? contactnumber,
    num? lat,
    num? long,
    bool? is_active,
  }) {
    return Address(
      name: name ?? this.name,
      userid: userid ?? this.userid,
      // lithosref: lithosref ?? this.lithosref,
      addressline_1: addressline_1 ?? this.addressline_1,
      addressline_2: addressline_2 ?? this.addressline_2,
      landmark: landmark ?? this.landmark,
      city: city ?? this.city,
      street: street ?? this.street,
      type: type ?? this.type,
      tower: tower ?? this.tower,
      society: society??this.society,
      floor: floor??this.floor,
      societyId: societyId??this.societyId,
      sector: sector ?? this.sector,
      house: house ?? this.house,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      contactnumber: contactnumber ?? this.contactnumber,
      lat: lat ?? this.lat,
      id: id ?? this.id,
      long: long ?? this.long,
      is_active: is_active ?? this.is_active,
    );
  }

  Map<String, dynamic> toMap({
    bool latneed = false,
    bool updateAddress = false,
  }) {
    Map<String, dynamic> map = <String, dynamic>{
      'name': name,
      'user_id': userid,
      // 'lithos_ref': lithosref,
      'address_line_1': addressline_1,
      'address_line_2': addressline_2,
      'landmark': landmark,
      'type': type,
      'street': street,
      'tower': tower,
      'house': house,
      'floor':floor,
      'society':society,
      'society_id':societyId,
      'sector': sector,
      'city': city,
      'state': state,
      'is_active': is_active,
      'pincode': pincode,
      'contact_number': contactnumber,
    };
    if (latneed) map.addAll({'lat': lat, 'long': long});
    if (updateAddress) {
      map.remove('lithos_ref');
      map.remove('user_id');
    }
    return map;
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      name: map['name'] != null ? map['name'] as String : null,
      is_active: map['is_active'],
      userid: map['user_id'] != null ? map['user_id'] as String : null,
      // lithosref: map['lithos_ref'] != null ? map['lithos_ref'] as int : null,
      addressline_1: map['address_line_1'] != null
          ? map['address_line_1'] as String
          : null,
      street: map['street'] != null ? map['street'] as String : null,
      floor: map['floor'] != null ? map['floor'] as String : null,
      tower: map['tower'] != null ? map['tower'] as String : null,
      society: map['society'] != null ? map['society'] as String : null,
      house: map['house'] != null ? map['house'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      sector: map['sector'] != null ? map['sector'] as String : null,
      societyId: map['society_id'] != null ? map['society_id'] as num : null,
      addressline_2: map['address_line_2'] != null
          ? map['address_line_2'] as String
          : null,
      landmark: map['landmark'] != null ? map['landmark'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      pincode: map['pincode'] != null ? map['pincode'] as num : null,
      contactnumber: map['contact_number'] != null
          ? map['contact_number'] as String
          : null,
      lat: map['lat'] != null ? map['lat'] as num : null,
      long: map['long'] != null ? map['long'] as num : null,
      id: map['id'] != null ? map['id'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      name,
      userid,
      // lithosref,
      addressline_1,
      addressline_2,
      street,
      house,
      floor,
      society,
      societyId,
      landmark,
      city,
      sector,
      tower,
      type,
      state,
      pincode,
      contactnumber,
      lat,
      long,
      is_active,
      id,
    ];
  }
}

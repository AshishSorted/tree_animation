// import 'dart:convert';
//
// List<PriceBucket> priceBucketListFromJson(String str) => List<PriceBucket>.from(
//     json.decode(str).map((x) => PriceBucket.fromJson(x)));
//
// String priceBucketListToJson(List<PriceBucket> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// PriceBucket priceBucketFromJson(String str) =>
//     PriceBucket.fromJson(json.decode(str));
//
// String priceBucketToJson(PriceBucket data) => json.encode(data.toJson());
//
// class PriceBucket {
//   PriceBucket({
//     this.max,
//     this.min,
//     this.salePrice,
//   });
//
//   double? max;
//   double? min;
//   double? salePrice;
//
//   factory PriceBucket.fromJson(Map<String, dynamic> json) => PriceBucket(
//     max: json["max"]?.toDouble(),
//     min: json["min"]?.toDouble(),
//     salePrice: json["sale_price"]?.toDouble(),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "max": max,
//     "min": min,
//     "sale_price": salePrice,
//   };
// }

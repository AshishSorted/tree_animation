import 'dart:convert';

List<SlotAvailability> slotsListFromJson(String str) =>
    List<SlotAvailability>.from(
        json.decode(str).map((x) => SlotAvailability.fromJson(x)));

String slotsListToJson(List<SlotAvailability> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

SlotAvailability slotsFromJson(String str) =>
    SlotAvailability.fromJson(json.decode(str));

String slotsToJson(SlotAvailability data) => json.encode(data.toJson());

class SlotAvailability {
  SlotAvailability({
    this.id,
    this.slot,
    this.availableCount,
    this.remainingCount,
    this.isAvailable,
  });

  int? id;
  String? slot;
  int? availableCount;
  int? remainingCount;
  bool? isAvailable;

  factory SlotAvailability.fromJson(Map<String, dynamic> json) => SlotAvailability(
    id: json["id"],
    slot: json["slot"],
    availableCount: json["availableCount"],
    remainingCount: json["remainingCount"],
    isAvailable: json["isAvailable"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slot": slot,
    "availableCount": availableCount,
    "remainingCount": remainingCount,
    "isAvailable": isAvailable,
  };
}
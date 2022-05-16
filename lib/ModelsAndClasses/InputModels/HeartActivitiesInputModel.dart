// To parse this JSON data, do
//
//     final heartActivities = heartActivitiesFromJson(jsonString);

import 'dart:convert';

HeartActivities heartActivitiesFromJson(String str) =>
    HeartActivities.fromJson(json.decode(str));

String heartActivitiesToJson(HeartActivities data) =>
    json.encode(data.toJson());

class HeartActivities {
  HeartActivities({
    required this.activitiesHeart,
  });

  List<ActivitiesHeart> activitiesHeart;

  factory HeartActivities.fromJson(Map<String, dynamic> json) =>
      HeartActivities(
        activitiesHeart: List<ActivitiesHeart>.from(
            json["activities-heart"].map((x) => ActivitiesHeart.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "activities-heart":
            List<dynamic>.from(activitiesHeart.map((x) => x.toJson())),
      };
}

class ActivitiesHeart {
  ActivitiesHeart({
    this.dateTime,
    this.value,
  });

  DateTime? dateTime;
  Value? value;

  factory ActivitiesHeart.fromJson(Map<String, dynamic> json) =>
      ActivitiesHeart(
        dateTime: DateTime.parse(json["dateTime"]),
        value: Value.fromJson(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "dateTime":
            "${dateTime!.year.toString().padLeft(4, '0')}-${dateTime!.month.toString().padLeft(2, '0')}-${dateTime!.day.toString().padLeft(2, '0')}",
        "value": value!.toJson(),
      };
}

class Value {
  Value({
    this.customHeartRateZones,
    this.heartRateZones,
  });

  List<HeartRateZone>? customHeartRateZones;
  List<HeartRateZone>? heartRateZones;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        customHeartRateZones: List<HeartRateZone>.from(
            json["customHeartRateZones"].map((x) => HeartRateZone.fromJson(x))),
        heartRateZones: List<HeartRateZone>.from(
            json["heartRateZones"].map((x) => HeartRateZone.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customHeartRateZones":
            List<dynamic>.from(customHeartRateZones!.map((x) => x.toJson())),
        "heartRateZones":
            List<dynamic>.from(heartRateZones!.map((x) => x.toJson())),
      };
}

class HeartRateZone {
  HeartRateZone({
    this.caloriesOut,
    this.max,
    this.min,
    this.minutes,
    this.name,
  });

  int? caloriesOut;
  int? max;
  int? min;
  int? minutes;
  String? name;

  factory HeartRateZone.fromJson(Map<String, dynamic> json) => HeartRateZone(
        caloriesOut: json["caloriesOut"] ?? 0,
        max: json["max"],
        min: json["min"],
        minutes: json["minutes"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "caloriesOut": caloriesOut,
        "max": max,
        "min": min,
        "minutes": minutes,
        "name": name,
      };
}

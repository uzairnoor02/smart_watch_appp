// To parse this JSON data, do
//
//     final cardio = cardioFromJson(jsonString);

import 'dart:convert';

Cardio cardioFromJson(String str) => Cardio.fromJson(json.decode(str));

String cardioToJson(Cardio data) => json.encode(data.toJson());

class Cardio {
  Cardio({
    required this.activitiesHeart,
  });

  List<ActivitiesHeart> activitiesHeart;

  factory Cardio.fromJson(Map<String, dynamic> json) => Cardio(
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
    required this.dateTime,
    required this.value,
  });

  DateTime dateTime;
  Value value;

  factory ActivitiesHeart.fromJson(Map<String, dynamic> json) =>
      ActivitiesHeart(
        dateTime: DateTime.parse(json["dateTime"]),
        value: Value.fromJson(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "dateTime":
            "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}",
        "value": value.toJson(),
      };
}

class Value {
  Value({
    required this.customHeartRateZones,
    required this.heartRateZones,
  });

  List<dynamic> customHeartRateZones;
  List<HeartRateZone> heartRateZones;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        customHeartRateZones:
            List<dynamic>.from(json["customHeartRateZones"].map((x) => x)),
        heartRateZones: List<HeartRateZone>.from(
            json["heartRateZones"].map((x) => HeartRateZone.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customHeartRateZones":
            List<dynamic>.from(customHeartRateZones.map((x) => x)),
        "heartRateZones":
            List<dynamic>.from(heartRateZones.map((x) => x.toJson())),
      };
}

class HeartRateZone {
  HeartRateZone({
    required this.max,
    required this.min,
    required this.name,
  });

  int max;
  int min;
  String name;

  factory HeartRateZone.fromJson(Map<String, dynamic> json) => HeartRateZone(
        max: json["max"],
        min: json["min"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "max": max,
        "min": min,
        "name": name,
      };
}

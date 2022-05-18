// To parse this JSON data, do
//
//     final miles = milesFromJson(jsonString);

import 'dart:convert';

Miles milesFromJson(String str) => Miles.fromJson(json.decode(str));

String milesToJson(Miles data) => json.encode(data.toJson());

class Miles {
  Miles({
    required this.activitiesDistance,
  });

  List<ActivitiesDistance> activitiesDistance;

  factory Miles.fromJson(Map<String, dynamic> json) => Miles(
        activitiesDistance: List<ActivitiesDistance>.from(
            json["activities-distance"]
                .map((x) => ActivitiesDistance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "activities-distance":
            List<dynamic>.from(activitiesDistance.map((x) => x.toJson())),
      };
}

class ActivitiesDistance {
  ActivitiesDistance({
    required this.dateTime,
    required this.value,
  });

  DateTime dateTime;
  String value;

  factory ActivitiesDistance.fromJson(Map<String, dynamic> json) =>
      ActivitiesDistance(
        dateTime: DateTime.parse(json["dateTime"]),
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "dateTime":
            "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}",
        "value": value,
      };
}

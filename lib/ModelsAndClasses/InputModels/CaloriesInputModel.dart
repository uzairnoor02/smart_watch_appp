// To parse this JSON data, do
//
//     final calories = caloriesFromJson(jsonString);

import 'dart:convert';

Calories caloriesFromJson(String str) => Calories.fromJson(json.decode(str));

String caloriesToJson(Calories data) => json.encode(data.toJson());

class Calories {
  Calories({
    required this.activitiesCalories,
  });

  List<ActivitiesCalory> activitiesCalories;

  factory Calories.fromJson(Map<String, dynamic> json) => Calories(
        activitiesCalories: List<ActivitiesCalory>.from(
            json["activities-calories"]
                .map((x) => ActivitiesCalory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "activities-calories":
            List<dynamic>.from(activitiesCalories.map((x) => x.toJson())),
      };
}

class ActivitiesCalory {
  ActivitiesCalory({
    required this.dateTime,
    required this.value,
  });

  DateTime dateTime;
  String value;

  factory ActivitiesCalory.fromJson(Map<String, dynamic> json) =>
      ActivitiesCalory(
        dateTime: DateTime.parse(json["dateTime"]),
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "dateTime":
            "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}",
        "value": value,
      };
}

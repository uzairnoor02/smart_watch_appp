// To parse this JSON data, do
//
//     final steps = stepsFromJson(jsonString);

import 'dart:convert';

Steps stepsFromJson(String str) => Steps.fromJson(json.decode(str));

String stepsToJson(Steps data) => json.encode(data.toJson());

class Steps {
  Steps({
    required this.activitiesSteps,
  });

  List<ActivitiesStep> activitiesSteps;

  factory Steps.fromJson(Map<String, dynamic> json) => Steps(
        activitiesSteps: List<ActivitiesStep>.from(
            json["activities-steps"].map((x) => ActivitiesStep.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "activities-steps":
            List<dynamic>.from(activitiesSteps.map((x) => x.toJson())),
      };
}

class ActivitiesStep {
  ActivitiesStep({
    required this.dateTime,
    required this.value,
  });

  DateTime dateTime;
  String value;

  factory ActivitiesStep.fromJson(Map<String, dynamic> json) => ActivitiesStep(
        dateTime: DateTime.parse(json["dateTime"]),
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "dateTime":
            "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}",
        "value": value,
      };
}

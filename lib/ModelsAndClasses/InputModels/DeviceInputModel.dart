// To parse this JSON data, do
//
//     final device = deviceFromJson(jsonString);

import 'dart:convert';

List<Device> deviceFromJson(String str) =>
    List<Device>.from(json.decode(str).map((x) => Device.fromJson(x)));

String deviceToJson(List<Device> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Device {
  Device({
    required this.battery,
    required this.batteryLevel,
    required this.deviceVersion,
    required this.features,
    required this.id,
    required this.lastSyncTime,
    required this.mac,
    required this.type,
  });

  String battery;
  int batteryLevel;
  String deviceVersion;
  List<dynamic> features;
  String id;
  DateTime lastSyncTime;
  String mac;
  String type;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        battery: json["battery"],
        batteryLevel: json["batteryLevel"],
        deviceVersion: json["deviceVersion"],
        features: List<dynamic>.from(json["features"].map((x) => x)),
        id: json["id"],
        lastSyncTime: DateTime.parse(json["lastSyncTime"]),
        mac: json["mac"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "battery": battery,
        "batteryLevel": batteryLevel,
        "deviceVersion": deviceVersion,
        "features": List<dynamic>.from(features.map((x) => x)),
        "id": id,
        "lastSyncTime": lastSyncTime.toIso8601String(),
        "mac": mac,
        "type": type,
      };
}

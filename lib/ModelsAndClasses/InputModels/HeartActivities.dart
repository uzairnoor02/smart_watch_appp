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

// class HeartActivities {
//   List<ActivitiesHeart>? _activitiesHeart;
//
//   HeartActivitiess({List<ActivitiesHeart>? activitiesHeart}) {
//     if (activitiesHeart != null) {
//       _activitiesHeart = activitiesHeart;
//     }
//   }
//
//   List<ActivitiesHeart>? get activitiesHeart => _activitiesHeart;
//   set activitiesHeart(List<ActivitiesHeart>? activitiesHeart) =>
//       _activitiesHeart = activitiesHeart;
//
//   HeartActivities.fromJson(Map<String, dynamic> json) {
//     if (json['activities-heart'] != null) {
//       _activitiesHeart = <ActivitiesHeart>[];
//       json['activities-heart'].forEach((v) {
//         _activitiesHeart!.add(ActivitiesHeart.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (_activitiesHeart != null) {
//       data['activities-heart'] =
//           _activitiesHeart!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class ActivitiesHeart {
//   String? _dateTime;
//   Value? _value;
//
//   ActivitiesHeart({String? dateTime, Value? value}) {
//     if (dateTime != null) {
//       _dateTime = dateTime;
//     }
//     if (value != null) {
//       _value = value;
//     }
//   }
//
//   String? get dateTime => _dateTime;
//   set dateTime(String? dateTime) => _dateTime = dateTime;
//   Value? get value => _value;
//   set value(Value? value) => _value = value;
//
//   ActivitiesHeart.fromJson(Map<String, dynamic> json) {
//     _dateTime = json['dateTime'];
//     _value = json['value'] != null ? Value.fromJson(json['value']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['dateTime'] = _dateTime;
//     if (_value != null) {
//       data['value'] = _value!.toJson();
//     }
//     return data;
//   }
// }
//
// class Value {
//   List<void>? _customHeartRateZones;
//   List<HeartRateZones>? _heartRateZones;
//
//   Value(
//       {List<void>? customHeartRateZones,
//       List<HeartRateZones>? heartRateZones}) {
//     if (customHeartRateZones != null) {
//       _customHeartRateZones = customHeartRateZones;
//     }
//     if (heartRateZones != null) {
//       _heartRateZones = heartRateZones;
//     }
//   }
//
//   List<void>? get customHeartRateZones => _customHeartRateZones;
//   set customHeartRateZones(List<void>? customHeartRateZones) =>
//       _customHeartRateZones = customHeartRateZones;
//   List<HeartRateZones>? get heartRateZones => _heartRateZones;
//   set heartRateZones(List<HeartRateZones>? heartRateZones) =>
//       _heartRateZones = heartRateZones;
//
//   Value.fromJson(Map<String, dynamic> json) {
//     if (json['customHeartRateZones'] != null) {
//       _customHeartRateZones = <Null>[];
//       json['customHeartRateZones'].forEach((v) {
//         _customHeartRateZones!.add(v.fromJson(v));
//       });
//     }
//     if (json['heartRateZones'] != null) {
//       _heartRateZones = <HeartRateZones>[];
//       json['heartRateZones'].forEach((v) {
//         _heartRateZones!.add(HeartRateZones.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (_customHeartRateZones != null) {
//       data['customHeartRateZones'] =
//           _customHeartRateZones!.map((v) => toJson()).toList();
//     }
//     if (_heartRateZones != null) {
//       data['heartRateZones'] = _heartRateZones!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class HeartRateZones {
//   int? _max;
//   int? _min;
//   String? _name;
//
//   HeartRateZones({int? max, int? min, String? name}) {
//     if (max != null) {
//       _max = max;
//     }
//     if (min != null) {
//       _min = min;
//     }
//     if (name != null) {
//       _name = name;
//     }
//   }
//
//   int? get max => _max;
//   set max(int? max) => _max = max;
//   int? get min => _min;
//   set min(int? min) => _min = min;
//   String? get name => _name;
//   set name(String? name) => _name = name;
//
//   HeartRateZones.fromJson(Map<String, dynamic> json) {
//     _max = json['max'];
//     _min = json['min'];
//     _name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['max'] = _max;
//     data['min'] = _min;
//     data['name'] = _name;
//     return data;
//   }
// }

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'dart:ffi';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.user,
  });

  UserClass user;

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: UserClass.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class UserClass {
  UserClass({
    this.age = 0,
    this.ambassador = false,
    this.autoStrideEnabled = false,
    this.avatar = "",
    this.avatar150 = "",
    this.avatar640 = "",
    this.averageDailySteps = 0,
    this.challengesBeta = false,
    this.clockTimeDisplayFormat = "",
    this.corporate = false,
    this.corporateAdmin = false,
    this.dateOfBirth,
    this.displayName = "",
    this.displayNameSetting = "",
    this.distanceUnit = "",
    this.encodedId = "",
    this.features,
    this.firstName = "",
    this.foodsLocale = "",
    this.fullName = "",
    this.gender = "",
    this.glucoseUnit = "",
    this.height = 0.0,
    this.heightUnit = "",
    this.isBugReportEnabled = false,
    this.isChild = false,
    this.isCoach = false,
    this.languageLocale = "",
    this.lastName = "",
    this.legalTermsAcceptRequired = false,
    this.locale = "",
    this.memberSince,
    this.mfaEnabled = false,
    this.offsetFromUtcMillis = 0,
    this.sdkDeveloper = false,
    this.sleepTracking = '',
    this.startDayOfWeek = '',
    this.strideLengthRunning = 0.0,
    this.strideLengthRunningType = '',
    this.strideLengthWalking = 0.0,
    this.strideLengthWalkingType = '',
    this.swimUnit = '',
    this.temperatureUnit = '',
    this.timezone = '',
    this.topBadges = const [],
    this.waterUnit = '',
    this.waterUnitName = '',
    this.weight = 0.0,
    this.weightUnit = '',
  });

  int age;
  bool ambassador;
  bool autoStrideEnabled;
  String avatar;
  String avatar150;
  String avatar640;
  int averageDailySteps;
  bool challengesBeta;
  String clockTimeDisplayFormat;
  bool corporate;
  bool corporateAdmin;
  DateTime? dateOfBirth;
  String displayName;
  String displayNameSetting;
  String distanceUnit;
  String encodedId;
  Features? features;
  String firstName;
  String foodsLocale;
  String fullName;
  String gender;
  String glucoseUnit;
  double height;
  String heightUnit;
  bool isBugReportEnabled;
  bool isChild;
  bool isCoach;
  String languageLocale;
  String lastName;
  bool legalTermsAcceptRequired;
  String locale;
  DateTime? memberSince;
  bool mfaEnabled;
  int offsetFromUtcMillis;
  bool sdkDeveloper;
  String sleepTracking;
  String startDayOfWeek;
  double strideLengthRunning;
  String strideLengthRunningType;
  double strideLengthWalking;
  String strideLengthWalkingType;
  String swimUnit;
  String temperatureUnit;
  String timezone;
  List<TopBadge> topBadges;
  String waterUnit;
  String waterUnitName;
  double weight;
  String weightUnit;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        age: json["age"],
        ambassador: json["ambassador"],
        autoStrideEnabled: json["autoStrideEnabled"] ?? false,
        avatar: json["avatar"],
        avatar150: json["avatar150"],
        avatar640: json["avatar640"],
        averageDailySteps: json["averageDailySteps"],
        challengesBeta: json["challengesBeta"],
        clockTimeDisplayFormat: json["clockTimeDisplayFormat"],
        corporate: json["corporate"],
        corporateAdmin: json["corporateAdmin"],
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        displayName: json["displayName"],
        displayNameSetting: json["displayNameSetting"],
        distanceUnit: json["distanceUnit"],
        encodedId: json["encodedId"],
        features: Features.fromJson(json["features"]),
        firstName: json["firstName"],
        foodsLocale: json["foodsLocale"],
        fullName: json["fullName"],
        gender: json["gender"],
        glucoseUnit: json["glucoseUnit"],
        height: json["height"].toDouble(),
        heightUnit: json["heightUnit"],
        isBugReportEnabled: json["isBugReportEnabled"],
        isChild: json["isChild"],
        isCoach: json["isCoach"],
        languageLocale: json["languageLocale"],
        lastName: json["lastName"],
        legalTermsAcceptRequired: json["legalTermsAcceptRequired"],
        locale: json["locale"],
        memberSince: DateTime.parse(json["memberSince"]),
        mfaEnabled: json["mfaEnabled"],
        offsetFromUtcMillis: json["offsetFromUTCMillis"],
        sdkDeveloper: json["sdkDeveloper"],
        sleepTracking: json["sleepTracking"],
        startDayOfWeek: json["startDayOfWeek"],
        strideLengthRunning: json["strideLengthRunning"].toDouble(),
        strideLengthRunningType: json["strideLengthRunningType"],
        strideLengthWalking: json["strideLengthWalking"].toDouble(),
        strideLengthWalkingType: json["strideLengthWalkingType"],
        swimUnit: json["swimUnit"],
        temperatureUnit: json["temperatureUnit"] ?? "",
        timezone: json["timezone"],
        topBadges: List<TopBadge>.from(
            json["topBadges"].map((x) => TopBadge.fromJson(x))),
        waterUnit: json["waterUnit"],
        waterUnitName: json["waterUnitName"],
        weight: json["weight"],
        weightUnit: json["weightUnit"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
        "ambassador": ambassador,
        "autoStrideEnabled": autoStrideEnabled,
        "avatar": avatar,
        "avatar150": avatar150,
        "avatar640": avatar640,
        "averageDailySteps": averageDailySteps,
        "challengesBeta": challengesBeta,
        "clockTimeDisplayFormat": clockTimeDisplayFormat,
        "corporate": corporate,
        "corporateAdmin": corporateAdmin,
        "dateOfBirth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "displayName": displayName,
        "displayNameSetting": displayNameSetting,
        "distanceUnit": distanceUnit,
        "encodedId": encodedId,
        "features": features!.toJson(),
        "firstName": firstName,
        "foodsLocale": foodsLocale,
        "fullName": fullName,
        "gender": gender,
        "glucoseUnit": glucoseUnit,
        "height": height,
        "heightUnit": heightUnit,
        "isBugReportEnabled": isBugReportEnabled,
        "isChild": isChild,
        "isCoach": isCoach,
        "languageLocale": languageLocale,
        "lastName": lastName,
        "legalTermsAcceptRequired": legalTermsAcceptRequired,
        "locale": locale,
        "memberSince":
            "${memberSince!.year.toString().padLeft(4, '0')}-${memberSince!.month.toString().padLeft(2, '0')}-${memberSince!.day.toString().padLeft(2, '0')}",
        "mfaEnabled": mfaEnabled,
        "offsetFromUTCMillis": offsetFromUtcMillis,
        "sdkDeveloper": sdkDeveloper,
        "sleepTracking": sleepTracking,
        "startDayOfWeek": startDayOfWeek,
        "strideLengthRunning": strideLengthRunning,
        "strideLengthRunningType": strideLengthRunningType,
        "strideLengthWalking": strideLengthWalking,
        "strideLengthWalkingType": strideLengthWalkingType,
        "swimUnit": swimUnit,
        "temperatureUnit": temperatureUnit,
        "timezone": timezone,
        "topBadges": List<dynamic>.from(topBadges.map((x) => x.toJson())),
        "waterUnit": waterUnit,
        "waterUnitName": waterUnitName,
        "weight": weight,
        "weightUnit": weightUnit,
      };
}

class Features {
  Features({
    this.exerciseGoal = false,
  });

  bool exerciseGoal;

  factory Features.fromJson(Map<String, dynamic> json) => Features(
        exerciseGoal: json["exerciseGoal"],
      );

  Map<String, dynamic> toJson() => {
        "exerciseGoal": exerciseGoal,
      };
}

class TopBadge {
  TopBadge({
    required this.badgeGradientEndColor,
    required this.badgeGradientStartColor,
    required this.badgeType,
    required this.category,
    required this.cheers,
    required this.dateTime,
    required this.description,
    required this.earnedMessage,
    required this.encodedId,
    required this.image100Px,
    required this.image125Px,
    required this.image300Px,
    required this.image50Px,
    required this.image75Px,
    required this.marketingDescription,
    required this.mobileDescription,
    required this.name,
    required this.shareImage640Px,
    required this.shareText,
    required this.shortDescription,
    required this.shortName,
    required this.timesAchieved,
    required this.value,
  });

  String badgeGradientEndColor;
  String badgeGradientStartColor;
  String badgeType;
  String category;
  List<dynamic> cheers;
  DateTime dateTime;
  String description;
  String earnedMessage;
  String encodedId;
  String image100Px;
  String image125Px;
  String image300Px;
  String image50Px;
  String image75Px;
  String marketingDescription;
  String mobileDescription;
  String name;
  String shareImage640Px;
  String shareText;
  String shortDescription;
  String shortName;
  int timesAchieved;
  int value;

  factory TopBadge.fromJson(Map<String, dynamic> json) => TopBadge(
        badgeGradientEndColor: json["badgeGradientEndColor"],
        badgeGradientStartColor: json["badgeGradientStartColor"],
        badgeType: json["badgeType"],
        category: json["category"],
        cheers: List<dynamic>.from(json["cheers"].map((x) => x)),
        dateTime: DateTime.parse(json["dateTime"]),
        description: json["description"],
        earnedMessage: json["earnedMessage"],
        encodedId: json["encodedId"],
        image100Px: json["image100px"],
        image125Px: json["image125px"],
        image300Px: json["image300px"],
        image50Px: json["image50px"],
        image75Px: json["image75px"],
        marketingDescription: json["marketingDescription"],
        mobileDescription: json["mobileDescription"],
        name: json["name"],
        shareImage640Px: json["shareImage640px"],
        shareText: json["shareText"],
        shortDescription: json["shortDescription"],
        shortName: json["shortName"],
        timesAchieved: json["timesAchieved"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "badgeGradientEndColor": badgeGradientEndColor,
        "badgeGradientStartColor": badgeGradientStartColor,
        "badgeType": badgeType,
        "category": category,
        "cheers": List<dynamic>.from(cheers.map((x) => x)),
        "dateTime":
            "${dateTime.year.toString().padLeft(4, '0')}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}",
        "description": description,
        "earnedMessage": earnedMessage,
        "encodedId": encodedId,
        "image100px": image100Px,
        "image125px": image125Px,
        "image300px": image300Px,
        "image50px": image50Px,
        "image75px": image75Px,
        "marketingDescription": marketingDescription,
        "mobileDescription": mobileDescription,
        "name": name,
        "shareImage640px": shareImage640Px,
        "shareText": shareText,
        "shortDescription": shortDescription,
        "shortName": shortName,
        "timesAchieved": timesAchieved,
        "value": value,
      };
}

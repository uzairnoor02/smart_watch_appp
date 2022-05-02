import 'dart:convert';

import 'package:http/http.dart' as http;

import 'InputModels/HeartActivities.dart';

Future<dynamic> myhttpcall(uri) async {
  var headers = {
    'Authorization':
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMzhCV1giLCJzdWIiOiI5WVg2NVgiLCJpc3MiOiJGaXRiaXQiLCJ0eXAiOiJhY2Nlc3NfdG9rZW4iLCJzY29wZXMiOiJ3aHIgd251dCB3cHJvIHdzbGUgd3dlaSB3c29jIHdzZXQgd2FjdCB3bG9jIiwiZXhwIjoxNjUxNzEzMzI2LCJpYXQiOjE2NTExMDg1MjZ9.9GB8zF8uaqzm-nSAG3W5IhyC6atNZVgEYBwOLXlTJEM",
    'Cookie':
        'fct=cfcc5b4ea1dd41cda946f0decd4d7f9c; JSESSIONID=8AB2FE903D69C660A11A5E53381942E6.fitbit1'
  };
  var request = http.Request('GET', Uri.parse(uri));
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    print(" in http.dart");
    print(await response.stream.bytesToString());

    HeartActivities heartActivities = HeartActivities.fromJson(jsonDecode("${{
      "activities-heart": [
        {
          "dateTime": "2022-04-28",
          "value": {
            "customHeartRateZones": [],
            "heartRateZones": [
              {"max": 98, "min": 30, "name": "Out of Range"},
              {"max": 137, "min": 98, "name": "Fat Burn"},
              {"max": 167, "min": 137, "name": "Cardio"},
              {"max": 220, "min": 167, "name": "Peak"}
            ]
          }
        }
      ]
    }}"));

    print(heartActivities.activitiesHeart);
    print("New value");
  } else {
    print(response.reasonPhrase);
  }
  return response;
}

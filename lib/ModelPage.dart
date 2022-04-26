import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';

import 'package:flutter_web_auth/flutter_web_auth.dart';

import 'dart:convert' show jsonDecode;
import 'package:http/http.dart' as http;

Future<String> getToken() async {
// App specific variables
  const googleClientId = '238GCP';
  const callbackUrlScheme = 'https://localhost:/';
// https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=238GCP&redirect_uri=https%3A%2F%2Fe832-119-73-124-59.in.ngrok.io%2Fauth%2Fauthorization&scope=activity%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=604800
// Construct the url
  print("calback $callbackUrlScheme");
  final url = Uri.https('www.fitbit.com', '/oauth2/authorize', {
    'response_type': 'code',
    'client_id': googleClientId,
    'redirect_uri': "$callbackUrlScheme:/",
    'scope': 'heartrate'
  });
//   final url = Uri.parse(
//       'https://www.fitbit.com/oauth2/authorize?response_type=token&client_id=238GCP&redirect_uri=https%3A%2F%2Fpartyai%3A%2F&scope=activity%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=604800');

  print("query parameter ");
  print(url);

// Present the dialog to the user
  final result = await FlutterWebAuth.authenticate(
    url: url.toString(),
    callbackUrlScheme: 'localhost',
  );

// Extract code from resulting url
  final code = Uri.parse(result).queryParameters['code'];

  print("result parameter ");
  print(code);
// Use this code to get an access token
  final uri = Uri.parse("https://api.fitbit.com/oauth2/token");
  final response = await http.post(uri, headers: {
    'Authorization':
        'Basic MjM4R0NQOmI1Mjc5NTY0MmQ4Mjc5NzhjOGQ5YzQxOWY0ZjEzNWZi',
    'Content-Type': 'application/x-www-form-urlencoded'
  }, body: {
    'client_id': googleClientId,
    'redirect_uri': 'https://partyai:/',
    'grant_type': 'authorization_code',
    'code': code,
  });

// Get the access token from the response
  final accessToken = jsonDecode(response.body)['access_token'] as String;
  return accessToken;
}

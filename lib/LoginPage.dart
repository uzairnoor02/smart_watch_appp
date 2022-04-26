import 'dart:io';

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:smart_watch_app/main.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Component/Components.dart';
import 'HomePage.dart';
import 'SignupPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String url =
      "https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=238GCP&redirect_uri=https%3A%2F%2Ffee5-119-73-124-59.ngrok.io%2Fauth%2Fauthorization&scope=activity%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=604800";

  final authorizationEndpoint = Uri.parse(
      "https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=238GCP&redirect_uri=https%3A%2F%2Fe832-119-73-124-59.in.ngrok.io%2Fauth%2Fauthorization&scope=activity%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=604800");

  final tokenEndpoint = Uri.parse('http://api.fitbit.com/oauth2/token');

  final identifier = '238GCP';
  final secret = 'b52795642d827978c8d9c419f4f135fb';

  final redirectUrl = Uri.parse('http://localhost.com/auth/authorization');
  final credentialsFile = File('~/.myapp/credentials.json');

  Future<oauth2.Client> createClient() async {
    var exists = await credentialsFile.exists();

    // If the OAuth2 credentials have already been saved from a previous run, we
    // just want to reload them.
    if (exists) {
      var credentials =
          oauth2.Credentials.fromJson(await credentialsFile.readAsString());
      return oauth2.Client(credentials, identifier: identifier, secret: secret);
    }

    // If we don't have OAuth2 credentials yet, we need to get the resource owner
    // to authorize us. We're assuming here that we're a command-line application.
    var grant = oauth2.AuthorizationCodeGrant(
        identifier, authorizationEndpoint, tokenEndpoint,
        secret: secret);

    // A URL on the authorization server (authorizationEndpoint with some additional
    // query parameters). Scopes and state can optionally be passed into this method.
    var authorizationUrl = grant.getAuthorizationUrl(redirectUrl);

    // Redirect the resource owner to the authorization URL. Once the resource
    // owner has authorized, they'll be redirected to `redirectUrl` with an
    // authorization code. The `redirect` should cause the browser to redirect to
    // another URL which should also have a listener.
    //
    // `redirect` and `listen` are not shown implemented here. See below for the
    // details.
    if (await canLaunch(authorizationUrl.toString())) {
      await launch(authorizationUrl.toString());
    }

    Future<Uri?> listen({required Uri redirectUrl}) async {
      var responseUrl;
      final linksStream = getLinksStream().listen((uri) async {
        if (uri
            .toString()
            .startsWith("http://localhost.com/auth/authorization")) {
          responseUrl = uri;
        }
      });
      return responseUrl;
    }

    Uri? responseUrl;
    responseUrl = await listen(redirectUrl: redirectUrl);
    // Once the user is redirected to `redirectUrl`, pass the query parameters to
    // the AuthorizationCodeGrant. It will validate them and extract the
    // authorization code to create a new Client.

    return await grant
        .handleAuthorizationResponse(responseUrl!.queryParameters);
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  openURL() async {
    String url = "https://www.google.com/";
    // final Uri uri = Uri.file(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Url not found";
    }
  }

  @override
  Widget build(BuildContext context) {
    String myURL = Uri.base.toString();

    print(myURL + "myyyy uurrll");
    return Scaffold(
      backgroundColor: const Color(0xff192442),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginPageInputField(
              prefix: Icons.email_outlined,
              hintText: 'Type Email',
              labelText: 'Email',
              emailController: _emailController,
              hideText: false,
            ),
            const SizedBox(height: 30),
            LoginPageInputField(
              prefix: Icons.password,
              hintText: 'Type Password',
              labelText: 'Password',
              emailController: _passwordController,
              hideText: true,
            ),
            const SizedBox(height: 80),
            BouncingWidget(
              onPressed: () async {
                // final myval = await myhttpcall(
                //     "https://api.fitbit.com/1/user/-/activities/heart/date/2022-04-28/1d.json"
                //     // "https://api.fitbit.com/1/user/-/profile.json"
                //     );
                // print(myval);
                // final String token = await getToken();

                // final result = await FlutterWebAuth.authenticate(
                //     url: authorizationEndpoint.toString(),
                //     callbackUrlScheme: "callbackUrlScheme");

                // final tokeen = Uri.parse(result).queryParameters["code"];
                // print("Token: $token");
                // print("Token: $tokeen");

                // print("result: $result");
                Future.delayed(const Duration(milliseconds: 400), () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                  // launch(
                  // "https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=238GCP&redirect_uri=https%3A%2F%2Ffee5-119-73-124-59.ngrok.io%2Fauth%2Fauthorization&scope=activity%20heartrate%20location%20nutrition%20profile%20settings%20sleep%20social%20weight&expires_in=604800");
                  // await openURL();
                });
                // });
              },
              child:
                  // Link(
                  //   target: LinkTarget.self,
                  //   uri: authorizationEndpoint,
                  //   builder: (context, followLink) => ElevatedButton(
                  //       onPressed: followLink, child: Text("Open link")),
                  // ),
                  Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff525355),
                ),
                child: const Center(
                    child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                "---- OR ----",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 15),
            BouncingWidget(
              onPressed: () async {
                // createClient();
                Future.delayed(const Duration(milliseconds: 500), () {
                  // showNotification();

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupPage()));
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff525355),
                ),
                child: const Center(
                    child: Text(
                  "SIGNUP",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showNotification({required String title, required String message}) {
  flutterLocalNotificationsPlugin.show(
      0,
      title,
      message,
      NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              // channel.description,
              // channel.description,
              importance: Importance.high,
              color: Colors.blue,
              playSound: true,
              // vibrationPattern: ,
              icon: "@mipmap/ic_launcher")));
}

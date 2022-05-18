import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff525355).withOpacity(.1),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "This application is based on the Iot Smart Health monitoring system.\nIn this application there is some functioning module is available like predication system, medical description, nutrition diet and so on.\n\nIn this application there's a prediction module where it predict the user health in notification foam. In this module user have to enter their blood pressure (BPM), Chest Pain, Smoke Detail, Diabetes detail. After entering the details it will predict the user Health Status.\nIf the user health is not good prediction system will refer to go to nearest hospital for check-up if it is normal then it will predict your health is good and try to maintain your health.\n\nOn the other hand in this application there's a medical description module is available where user enter their reports details in description foam or in picture foam it's user choice what he/she wants it's medical description.\n\nIn this application there's nutrition diet tips is available where user get some help to maintain it's health.\n\nIn our application there's a set remainder module where user set their medicine remainder according to his time and date. This module will generate a notification to the user when it times to take a medicine.\n\nThis application is based on flutter framework with dart language and some other Api's. Our main objective is to make this application easier and time saver for the people as well as it will secure paper hand book.\nThis application helps people to maintain their health in a very easy way. Our aim is to target life easier for the people.",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

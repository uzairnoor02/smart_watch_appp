import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Component/Components.dart';
import 'DescriptionPage.dart';
import 'DetailsPage.dart';
import 'HealthPredictionPage.dart';
import 'NutritionDietPage.dart';
import 'ScheduleNotification.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50),
                  height: MediaQuery.of(context).size.height / 5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 8,
                        offset: const Offset(0, 0),
                        blurRadius: 7.0,
                      )
                    ],
                  ),
                  child: Image.asset("Assets/SMBackground.jpg"),
                ),
              ),
              const SizedBox(height: 20),
              SettingWidget(
                icon: Icons.person,
                title: 'Details',
                logoutDialog: false,
                description: false,
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DetailsPage()));
                },
              ),
              SettingWidget(
                icon: Icons.description_outlined,
                title: "Description",
                logoutDialog: false,
                description: true,
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const DescriptionPage()));
                },
              ),
              SettingWidget(
                icon: Icons.notification_add,
                title: 'Set Reminder Notification',
                logoutDialog: false,
                description: false,
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScheduleNotificationPage()));
                },
              ),
              SettingWidget(
                icon: Icons.medication_liquid,
                title: 'Nutrition Diet',
                logoutDialog: false,
                description: false,
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NutritionDietPage()));
                },
              ),
              SettingWidget(
                icon: Icons.batch_prediction,
                title: 'Health Prediction',
                logoutDialog: false,
                description: false,
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HealthPredictionPage()));
                },
              ),
              SettingWidget(
                icon: Icons.logout,
                title: 'Exit',
                logoutDialog: true,
                description: false,
                onClick: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

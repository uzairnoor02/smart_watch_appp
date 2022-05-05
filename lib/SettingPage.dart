import 'package:flutter/material.dart';

import 'Component/Components.dart';
import 'ScheduleNotification.dart';
import 'SetScheduleNotification.dart';
import 'UploadDescriptionImagePage.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff192442),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 100),
            SettingWidget(
              icon: Icons.person,
              title: 'Details',
              logoutDialog: false,
              description: false,
              onClick: () {},
            ),
            SettingWidget(
              icon: Icons.description_outlined,
              title: "Description",
              logoutDialog: false,
              description: true,
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const uploadDescriptionImage()));
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
            // SettingWidget(
            //   icon: Icons.password,
            //   title: 'Change Password',
            //   logoutDialog: false,
            //   description: false,
            // ),
            SettingWidget(
              icon: Icons.info,
              title: 'Help and Support',
              logoutDialog: false,
              description: false,
              onClick: () {},
            ),
            SettingWidget(
              icon: Icons.construction,
              title: 'Term and Conditions',
              logoutDialog: false,
              description: false,
              onClick: () {},
            ),
            SettingWidget(
              icon: Icons.logout,
              title: 'Log Out',
              logoutDialog: true,
              description: false,
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}

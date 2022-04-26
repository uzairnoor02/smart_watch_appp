import 'package:flutter/material.dart';

import 'Component/Components.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // showNotification();
      //   },
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.black,
      //   ),
      //   backgroundColor: Colors.white,
      // ),
      backgroundColor: const Color(0xff192442),
      body: SafeArea(
        child: Column(
          children: const [
            SizedBox(height: 100),
            SettingWidget(
              icon: Icons.person,
              title: 'Details',
              logoutDialog: false,
              description: false,
            ),
            SettingWidget(
              icon: Icons.description_outlined,
              title: "Description",
              logoutDialog: false,
              description: true,
            ),
            SettingWidget(
              icon: Icons.tips_and_updates_outlined,
              title: 'Medical Tip',
              logoutDialog: false,
              description: false,
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
            ),
            SettingWidget(
              icon: Icons.construction,
              title: 'Term and Conditions',
              logoutDialog: false,
              description: false,
            ),
            SettingWidget(
              icon: Icons.logout,
              title: 'Log Out',
              logoutDialog: true,
              description: false,
            ),
          ],
        ),
      ),
    );
  }
}

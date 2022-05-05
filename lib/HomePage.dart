import 'package:flutter/material.dart';

import 'Component/Components.dart';
import 'SettingPage.dart';

class HomePage extends StatelessWidget {
  final String? payload;
  const HomePage({Key? key, required this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingPage()));
        },
        child: const Icon(
          Icons.person,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xff192442),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50),
                  height: MediaQuery.of(context).size.height / 5,
                  // width: MediaQuery.of(context).size.width * ,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Device: ", style: TextStyle(color: Colors.white)),
                  Text("Fitbit versa lite",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Battery: ", style: TextStyle(color: Colors.white)),
                  Text("----", style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 40),
              const HomePageCard(
                icon: "Assets/ShoesIcon.png",
                title: "Total steps",
                data: "-----",
                padding: false,
              ),
              const SizedBox(height: 15),
              const HomePageCard(
                icon: "Assets/HeartbeatIcon.png",
                title: "Heart rate",
                data: "----",
                padding: true,
              ),
              const SizedBox(height: 15),
              const HomePageCard(
                icon: "Assets/CaloriesIcon.png",
                title: "Calories",
                data: "-----",
                padding: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

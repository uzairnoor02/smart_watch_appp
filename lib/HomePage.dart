import 'package:flutter/material.dart';
import 'package:smart_watch_app/ModelsAndClasses/httpcall.dart';
import 'Component/Components.dart';
import 'ModelsAndClasses/InputModels/HeartActivitiesInputModel.dart';
import 'ModelsAndClasses/InputModels/StepsInputModel.dart';
import 'ModelsAndClasses/InputModels/UserInputModel.dart';
import 'SettingPage.dart';
// import 'SettingPage.dart';

class HomePage extends StatefulWidget {
  final String? payload;
  const HomePage({Key? key, required this.payload}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _steps = "";
  String _calories = "";
  String _displayName = "";

  void getProfile() async {
    var response =
        await myhttpcall("https://api.fitbit.com/1/user/-/profile.json");
    User data = userFromJson(response);

    setState(() {
      _displayName = data.user.displayName;
    });
  }

  void getSteps() async {
    var response = await myhttpcall(
        "https://api.fitbit.com/1/user/-/activities/steps/date/2022-05-14/2022-05-15.json");
    Steps data = stepsFromJson(response);
    String val = data.activitiesSteps[1].value;
    setState(() {
      _steps = val;
    });
  }

  void getHeartActivities() async {
    var response = await myhttpcall(
        "https://api.fitbit.com/1/user/-/activities/heart/date/2022-05-14/1d.json");
    HeartActivities data = heartActivitiesFromJson(response);
    var a = data.activitiesHeart[0].value!.heartRateZones![0].caloriesOut!;

    setState(() {
      _calories = a.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getSteps();
    getHeartActivities();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//          getSteps();
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
                  Text("Fitbit versa lite 2",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("User: ", style: TextStyle(color: Colors.white)),
                  Text(_displayName == "" ? "Loading..." : _displayName,
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
              const SizedBox(height: 40),
              HomePageCard(
                icon: "Assets/ShoesIcon.png",
                title: "Total steps",
                data: _steps == "" ? "Loading..." : _steps,
                padding: false,
              ),
              const SizedBox(height: 15),
              const HomePageCard(
                icon: "Assets/HeartbeatIcon.png",
                title: "Pulse rate",
                data: "85 to 106",
                padding: true,
              ),
              const SizedBox(height: 15),
              HomePageCard(
                icon: "Assets/CaloriesIcon.png",
                title: "Calories",
                data: _calories == "" ? "Loading..." : _calories,
                padding: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StreamBPM {
  final String value;
  final String dateTime;

  StreamBPM({
    required this.value,
    required this.dateTime,
  });

  static StreamBPM fromMap(Map<String, dynamic> map) {
    return StreamBPM(
      dateTime: map["dateTime"] ?? "",
      value: map[""],
    );
  }
}

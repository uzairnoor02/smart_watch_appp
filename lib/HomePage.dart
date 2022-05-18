import 'package:flutter/material.dart';
import 'package:smart_watch_app/ModelsAndClasses/httpcall.dart';
import 'Component/Components.dart';
import 'ModelsAndClasses/InputModels/BMPInputModel.dart';
import 'ModelsAndClasses/InputModels/CaloriesInputModel.dart';
import 'ModelsAndClasses/InputModels/DeviceInputModel.dart';
import 'ModelsAndClasses/InputModels/MilesInputModel.dart';
import 'ModelsAndClasses/InputModels/StepsInputModel.dart';
import 'ModelsAndClasses/InputModels/UserInputModel.dart';
import 'SettingPage.dart';
// import 'SettingPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _steps = "";
  String _calories = "";
  String _miles = "";
  String _displayName = "";
  String _max = "";
  String _min = "";
  String _deviceVersion = "";
  String _batteryLevel = "";

  void getDevice() async {
    var response =
        await myhttpcall("https://api.fitbit.com/1/user/-/devices.json");
    List<Device> data = deviceFromJson(response);
    setState(() {
      _batteryLevel = data[0].batteryLevel.toString();
      _deviceVersion = data[0].deviceVersion;
    });
  }

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
        "https://api.fitbit.com/1/user/-/activities/steps/date/today/1d.json");
    Steps data = stepsFromJson(response);
    String val = data.activitiesSteps[0].value;
    setState(() {
      _steps = val;
    });
  }

  void getCalories() async {
    var response = await myhttpcall(
        "https://api.fitbit.com/1/user/-/activities/calories/date/today/1d.json");
    Calories data = caloriesFromJson(response);
    var a = data.activitiesCalories[0].value;
    setState(() {
      _calories = a.toString();
    });
  }

  void getMiles() async {
    var response = await myhttpcall(
        "https://api.fitbit.com/1/user/-/activities/distance/date/today/1d.json");

    Miles data = milesFromJson(response);
    String a = data.activitiesDistance[0].value;
    setState(() {
      _miles = a;
    });
  }

  void getCardio() async {
    var response = await myhttpcall(
        "https://api.fitbit.com/1/user/-/activities/heart/date/today/1d.json");
    Cardio data = cardioFromJson(response);
    int max1 = data.activitiesHeart[0].value.heartRateZones[0].max;
    int max2 = data.activitiesHeart[0].value.heartRateZones[1].max;
    int max3 = data.activitiesHeart[0].value.heartRateZones[2].max;
    int max4 = data.activitiesHeart[0].value.heartRateZones[3].max;

    int min1 = data.activitiesHeart[0].value.heartRateZones[0].min;
    int min2 = data.activitiesHeart[0].value.heartRateZones[1].min;
    int min3 = data.activitiesHeart[0].value.heartRateZones[2].min;
    int min4 = data.activitiesHeart[0].value.heartRateZones[3].min;

    int max = (max1 + max2 + max3 + max4) ~/ 4;
    int min = (min1 + min2 + min3 + min4) ~/ 4;
    setState(() {
      _max = max.toString();
      _min = min.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getSteps();
    getProfile();
    getCardio();
    getDevice();
    getCalories();
    getMiles();
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
          color: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
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
                children: [
                  const Text("User Name: ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text(_displayName == "" ? "Fetching..." : _displayName,
                      style: const TextStyle(color: Colors.black)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Device: ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text(_deviceVersion == "" ? "Fetching..." : _deviceVersion,
                      style: const TextStyle(color: Colors.black)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Battery: ",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  Text(_batteryLevel == "" ? "Fetching..." : "$_batteryLevel%",
                      style: const TextStyle(color: Colors.black)),
                ],
              ),
              const SizedBox(height: 40),
              HomePageCard(
                icon: "Assets/ShoesIcon.png",
                title: "Total steps",
                data: _steps == "" ? "Fetching..." : _steps,
                padding: false,
              ),
              const SizedBox(height: 15),
              HomePageCard(
                icon: "Assets/HeartbeatIcon.png",
                title: "BPM",
                data:
                    _max == "" && _min == "" ? "Fetching..." : "$_min to $_max",
                padding: true,
              ),
              const SizedBox(height: 15),
              HomePageCard(
                icon: "Assets/CaloriesIcon.png",
                title: "Calories",
                data: _calories == "" ? "Fetching..." : _calories,
                padding: true,
              ),
              const SizedBox(height: 15),
              HomePageCard(
                icon: "Assets/Distance.png",
                title: "Miles",
                data: _miles == "" ? "Fetching..." : _miles,
                padding: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

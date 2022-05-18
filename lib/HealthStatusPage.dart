import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

class HealthStatusPage extends StatefulWidget {
  final int intBPM;
  final int intPainScale;
  final String painScale;
  final String bpm;
  final bool isSmoker;
  final bool isDiabetes;
  final bool isHeadache;
  const HealthStatusPage(
      {Key? key,
      required this.intBPM,
      required this.intPainScale,
      required this.painScale,
      required this.bpm,
      required this.isSmoker,
      required this.isDiabetes,
      required this.isHeadache})
      : super(key: key);

  @override
  _HealthStatusPageState createState() => _HealthStatusPageState();
}

String healthConditionMessage(
    {required int intBPM, required int intPainScale}) {
  if (intPainScale >= 7 || intBPM < 60 || intBPM > 100) {
    return "Your health condition is not in normal state.";
  } else {
    return "Your health condition is in normal state.";
  }
}

String bpmMessage({required int intBPM}) {
  if (intBPM < 60) {
    return "\nUse Aspirin for Low Blood Pressure";
  } else if (intBPM > 100) {
    return "\nUse Aspirin for High Blood Pressure";
  } else {
    return "\nYour Blood Pressure is Normal";
  }
}

String painMessage({required int intPainScale}) {
  if (intPainScale >= 7) {
    return "\nUse Dicloron for Chest Pain";
  } else {
    return "";
  }
}

class _HealthStatusPageState extends State<HealthStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Health Status"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Your BPM: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  TextSpan(
                    text: widget.bpm,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ])),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 15),
                  child: const Divider(color: Colors.black),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Pain Scale: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  TextSpan(
                    text: widget.painScale,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ])),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 15),
                  child: const Divider(color: Colors.black),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Smoking: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  TextSpan(
                    text: widget.isSmoker
                        ? "You need to prevent smoking for better health"
                        : "Non-Smoker",
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ])),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 15),
                  child: const Divider(color: Colors.black),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Diabetes: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  TextSpan(
                    text: widget.isDiabetes
                        ? "Maintain your Diabetes level between 75 to 110 for good health"
                        : "Negative",
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ])),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 15),
                  child: const Divider(color: Colors.black),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Headache: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  TextSpan(
                    text: widget.isHeadache
                        ? "Use Aspirin(Disprin) for instant relief during Headache"
                        : "Negative",
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ])),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 15),
                  child: const Divider(color: Colors.black),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: "Prediction: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  TextSpan(
                    text: healthConditionMessage(
                        intBPM: widget.intBPM,
                        intPainScale: widget.intPainScale),
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  TextSpan(
                    text: bpmMessage(intBPM: widget.intBPM),
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  TextSpan(
                    text: widget.intPainScale >= 7
                        ? painMessage(intPainScale: widget.intPainScale)
                        : "\nIts normal pain be Brave",
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const TextSpan(
                    text: "\nVisit you doctor as soon as possible ",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ])),
                SizedBox(height: MediaQuery.of(context).size.height / 50),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 15),
                  child: const Divider(color: Colors.black),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                BouncingWidget(
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 13,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueAccent,
                      ),
                      child: const Center(
                          child: Text(
                        "OKAY",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

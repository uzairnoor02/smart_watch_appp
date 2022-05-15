import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HealthStatusPage.dart';

class HealthPredictionPage extends StatefulWidget {
  const HealthPredictionPage({Key? key}) : super(key: key);

  @override
  _HealthPredictionPageState createState() => _HealthPredictionPageState();
}

TextEditingController _bpmController = TextEditingController();
TextEditingController _chestPainController = TextEditingController();
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

bool isSmoker = false;
bool isDiabetes = false;

class _HealthPredictionPageState extends State<HealthPredictionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff192442),
      appBar: AppBar(
        title: const Text("Health Prediction"),
        centerTitle: true,
        backgroundColor: const Color(0xff525355),
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                HealthPredictionTextFieldWidget(
                  labelText: "Your BPM",
                  hintText: "Enter Your BPM",
                  title: "Your BPM",
                  controller: _bpmController,
                ),
                HealthPredictionTextFieldWidget(
                  labelText: "Chest Pain",
                  hintText: "Enter Pain Scale: 0 to 10",
                  title: "Chest Pain",
                  controller: _chestPainController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 7),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        unselectedWidgetColor: const Color(0xff525355)),
                    child: CheckboxListTile(
                      title: const Text("Smoker ?",
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      subtitle: const Text(
                          "If you are not than leave is section",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: isSmoker,
                      onChanged: (value) {
                        setState(() {
                          isSmoker = value!;
                        });
                      },
                      activeColor: const Color(0xff525355),
                      checkColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 7),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        unselectedWidgetColor: const Color(0xff525355)),
                    child: CheckboxListTile(
                      title: const Text("Diabetes ?",
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      subtitle: const Text(
                          "If you are not suffering Diabetes than leave is section",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: isDiabetes,
                      onChanged: (val) {
                        setState(() {
                          isDiabetes = val!;
                        });
                      },
                      activeColor: const Color(0xff525355),
                      checkColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 20),
                BouncingWidget(
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      if (_formKey.currentState!.validate()) {
                        var bpm = _bpmController.text.trim();
                        var painScale = _chestPainController.text.trim();
                        int intBPM = int.parse(bpm);
                        int intPainScale = int.parse(painScale);

                        // Validation Algorithm

                        if (bpm.length > 3 || intBPM > 200) {
                          return showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  title: const Text(
                                    "Validation",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  content: const Text(
                                    "Please Insert valid BPM.e.g 1 to 200",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Okay",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        )),
                                  ],
                                );
                              });
                        } else if (painScale.length > 2 || intPainScale > 10) {
                          return showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  title: const Text(
                                    "Validation",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  content: const Text(
                                    "Please Insert valid Scale.e.g 1 to 10",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Okay",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        )),
                                  ],
                                );
                              });
                        }

                        // Prediction Algorithm

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HealthStatusPage(
                                      painScale: painScale,
                                      intBPM: intBPM,
                                      intPainScale: intPainScale,
                                      isDiabetes: isDiabetes,
                                      isSmoker: isSmoker,
                                      bpm: bpm,
                                    )));
                      }
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
                      "Health Status",
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
        ),
      ),
    );
  }
}

class HealthPredictionTextFieldWidget extends StatelessWidget {
  final String title;
  final String labelText;
  final String hintText;
  final TextEditingController controller;

  const HealthPredictionTextFieldWidget({
    Key? key,
    required this.title,
    required this.labelText,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height / 20),
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width / 7.2),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 35),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.15),
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            controller: controller,
            cursorColor: Colors.white,
            decoration: InputDecoration(
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                focusColor: Colors.white,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelText: labelText,
                labelStyle: const TextStyle(color: Colors.white),
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.white)),
            validator: (value) {
              if (value!.isEmpty) {
                return "Required";
              }
              return null;
            },
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}

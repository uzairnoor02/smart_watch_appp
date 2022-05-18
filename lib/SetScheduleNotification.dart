import 'dart:math';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'LocalNotificationClass.dart';
import 'ScheduleNotification.dart';

class SetScheduleNotification extends StatefulWidget {
  const SetScheduleNotification({Key? key}) : super(key: key);

  @override
  State<SetScheduleNotification> createState() =>
      _SetScheduleNotificationState();
}

class _SetScheduleNotificationState extends State<SetScheduleNotification> {
  late String _hour;
  late String _minute;
  late String _description;
  bool _buttonDisable = false;
  bool _indicatorBar = false;

  final _fireStore = FirebaseFirestore.instance;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _minuteController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalNotificationApi.init();
    listenNotification();
  }

  void listenNotification() {
    void onClickNotification(String? payload) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ScheduleNotificationPage()));
    }

    LocalNotificationApi.onNotification.stream.listen(onClickNotification);
  }

  Future<void> _upLoadReminderInfo({
    required int hour,
    required int minute,
  }) async {
    String newId = Random().nextInt(1000).toString();

    await _fireStore.collection("Reminder").doc(newId).set({
      "ColumnId": newId,
      "hour": _hour,
      "minute": _minute,
      "description": _description,
      "notificationId": newId,
      "datetime": DateTime.now()
    });

    final int id = int.parse(newId);

    await LocalNotificationApi.showScheduleNotification(
      id: id,
      title: "Schedule Notification AT: $_hour:$_minute",
      message: "Description: $_description",
      scheduleDate: DateTime.now().add(const Duration(seconds: 00)),
      hour: hour,
      second: 0,
      mint: minute,
    );

    var snackBar = SnackBar(
      content: Text(
        "Notification Schedule to  $_hour:$_minute ",
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
      backgroundColor: Colors.blueAccent,
    );
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ScheduleNotificationPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Set Reminder"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 10),
                    const Text(
                      "Set Reminder Notification",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 12),

                    ///Hours Input Field
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.15),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: _hourController,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusColor: Colors.black,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: "Set Hour",
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "24",
                            hintStyle: TextStyle(color: Colors.black)),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Required";
                          } else if (value.length > 2) {
                            return "Enter Hour. e.g 24";
                          } else {
                            setState(() {
                              _hour = value.trim().toString();
                            });
                          }
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 12),

                    ///Minutes Input Field
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.15),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: _minuteController,
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusColor: Colors.black,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            labelText: "Set Minute",
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: "60",
                            hintStyle: TextStyle(color: Colors.black)),
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Required";
                          } else if (value.length > 2) {
                            return "Enter Hour. e.g 60";
                          } else {
                            setState(() {
                              _minute = value.trim().toString();
                            });
                          }
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 12),

                    ///Description Input Field
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.15),
                      child: TextFormField(
                        controller: _descriptionController,
                        style: const TextStyle(color: Colors.black),
                        maxLines: 3,
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return "Required";
                          } else {
                            _description = value.trim().toString();
                          }
                        },
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          // border: InputBorder.none,
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusColor: Colors.black,
                          labelStyle: TextStyle(color: Colors.black),
                          alignLabelWithHint: true,
                          fillColor: Colors.black,
                          labelText: 'Description',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height / 12),
                    BouncingWidget(
                      onPressed: _buttonDisable == false
                          ? () async {
                              if (formkey.currentState!.validate()) {
                                try {
                                  final int hour = int.parse(_hour);
                                  final int minute = int.parse(_minute);

                                  if (hour > 24) {
                                    showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            title: const Text(
                                              "Validation",
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            content: const Text(
                                              "Enter Hours. e.g 1 to 24",
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    "Okay",
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  )),
                                            ],
                                          );
                                        });
                                  } else if (minute > 60) {
                                    showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            title: const Text(
                                              "Validation",
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            content: const Text(
                                              "Enter Minutes. e.g 1 to 60",
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    "Okay",
                                                    style: TextStyle(
                                                        color: Colors.black54),
                                                  )),
                                            ],
                                          );
                                        });
                                  } else {
                                    setState(() {
                                      _buttonDisable = true;
                                      _indicatorBar = true;
                                    });
                                    await _upLoadReminderInfo(
                                        hour: hour, minute: minute);
                                  }
                                } catch (e) {}
                              }
                            }
                          : () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height / 13,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueAccent,
                        ),
                        child: const Center(
                            child: Text(
                          "Set Reminder",
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
            Center(
              //   height: double.infinity,
              child: Visibility(
                  visible: _indicatorBar,
                  child: const CircularProgressIndicator(
                    color: Colors.blueAccent,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Component/Components.dart';
import 'LocalNotificationClass.dart';
import 'SetScheduleNotification.dart';

class ScheduleNotificationPage extends StatefulWidget {
  const ScheduleNotificationPage({Key? key}) : super(key: key);

  @override
  _ScheduleNotificationPageState createState() =>
      _ScheduleNotificationPageState();
}

class _ScheduleNotificationPageState extends State<ScheduleNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff192442),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const SetScheduleNotification()));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Color(0xff192442),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const ReminderStream(),
          ],
        ),
      ),
    );
  }
}

class ReminderStream extends StatefulWidget {
  const ReminderStream({
    Key? key,
  }) : super(key: key);

  @override
  State<ReminderStream> createState() => _ReminderStream();
}

class _ReminderStream extends State<ReminderStream> {
  final _fireStore = FirebaseFirestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fireStore.collection("Reminder").orderBy("datetime").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream:
            _fireStore.collection("Reminder").orderBy("datetime").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            final streamSnapshot = snapshot.data!.docs.reversed;
            List<reminderStreamClass> stream = [];
            for (var prestrm in streamSnapshot) {
              Map<String, dynamic>? map =
                  prestrm.data() as Map<String, dynamic>?;
              final reminderStream = reminderStreamClass.fromMap(map!);

              stream.add(reminderStream);
            }
            return ListView.builder(
              itemCount: stream.length,
              padding: const EdgeInsets.all(5),
              itemBuilder: (BuildContext context, int index) {
                final reminderStreamClass pre = stream[index];
                return GestureDetector(
                    onTap: () {
                      showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              title: const Text(
                                "Warning !!!",
                                style: TextStyle(color: Colors.black54),
                              ),
                              content: const Text(
                                "Are you sure you want to delete Reminder Notification ?",
                                style: TextStyle(color: Colors.black54),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "No",
                                      style: TextStyle(color: Colors.black54),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      _fireStore
                                          .collection("Reminder")
                                          .doc(pre.ColumnId)
                                          .delete();
                                      final int id =
                                          int.parse(pre.notificationId);

                                      LocalNotificationApi.cancel(id);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Yes",
                                      style: TextStyle(color: Colors.black54),
                                    )),
                              ],
                            );
                          });
                    },
                    child: ScheduleNotificationCard(
                      hour: pre.hour,
                      minute: pre.minute,
                      description: pre.description,
                    ));
              },
            );
          }
        },
      ),
    );
  }
}

class reminderStreamClass {
  final String datetime;
  final String hour;
  final String minute;
  final String ColumnId;
  final String description;
  final String notificationId;

  reminderStreamClass({
    required this.datetime,
    required this.hour,
    required this.minute,
    required this.ColumnId,
    required this.description,
    required this.notificationId,
  });
  static reminderStreamClass fromMap(Map<String, dynamic> map) {
    return reminderStreamClass(
      ColumnId: map["ColumnId"] ?? "",
      hour: map["hour"] ?? "",
      minute: map["minute"],
      description: map["description"] ?? "",
      datetime: map["dateTime"] ?? "",
      notificationId: map["notificationId"] ?? "",
    );
  }
}

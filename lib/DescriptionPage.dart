// import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:smart_watch_app/UploadDescriptionImagePage.dart';

import 'Component/Components.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'Component/Components.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Descriptions"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const uploadDescriptionImage()));
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          PerseptionStream(),
        ],
      )),
    );
  }
}

class PerseptionStream extends StatefulWidget {
  PerseptionStream({
    Key? key,
  }) : super(key: key);

  @override
  State<PerseptionStream> createState() => _PerseptionStreamState();
}

class _PerseptionStreamState extends State<PerseptionStream> {
  final _fireStore = FirebaseFirestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fireStore.collection("Prescription").orderBy("datetime").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: _fireStore
            .collection("Prescription")
            .orderBy("datetime")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            final streamSnapshot = snapshot.data!.docs.reversed;
            List<StreamPreception> stream = [];
            for (var prestrm in streamSnapshot) {
              Map<String, dynamic>? map =
                  prestrm.data() as Map<String, dynamic>?;
              final preceptioins = StreamPreception.fromMap(map!);

              stream.add(preceptioins);
            }
            return ListView.builder(
              itemCount: stream.length,
              padding: const EdgeInsets.all(5),
              itemBuilder: (BuildContext context, int index) {
                final StreamPreception pre = stream[index];
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
                              "Are you sure you want to delete Prescription ?",
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
                                        .collection("Prescription")
                                        .doc(pre.ColumnId)
                                        .delete();
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
                  child: ImageMessage(
                    description: pre.description,
                    image: pre.prescriptionimage,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class StreamPreception {
  final String datetime;
  final String email;
  final String prescriptionimage;
  final String ColumnId;
  final String description;
  // final String textSenderName;
  // final String textSenderUID;

  StreamPreception({
    required this.datetime,
    required this.email,
    required this.prescriptionimage,
    required this.ColumnId,
    required this.description,
  });
  // required this.groupId,
  // required this.groupName,
  // required this.text,
  // required this.textSenderName,
  // required this.textSenderUID});
  static StreamPreception fromMap(Map<String, dynamic> map) {
    return StreamPreception(
      description: map["description"] ?? "",
      datetime: map["dateTime"] ?? "",
      email: map["email"] ?? "",
      prescriptionimage: map["prescriptionimage"],
      ColumnId: map["ColumnId"] ?? "",
    );
  }
}

// import 'dart:math';

import 'dart:io';
// ignore_for_file: camel_case_types

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:smart_watch_app/LoginPage.dart';

import 'Component/Components.dart';

// import 'Components.dart';

class uploadDescriptionImage extends StatefulWidget {
  const uploadDescriptionImage({Key? key}) : super(key: key);

  @override
  State<uploadDescriptionImage> createState() => _uploadDescriptionImageState();
}

class _uploadDescriptionImageState extends State<uploadDescriptionImage> {
  File? image;

  UploadTask? task;

  var urlDownloadLink;

  var downloadLink;

  bool _indicatorBar = false;

  String? description;

  final _firestore = FirebaseFirestore.instance;
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future uploadImage() async {
    if (image == null) return;
    final String imageName = basename(image!.path);
    final destination = "Prescription/$imageName";
    task = FirebaseApi.uploadFile(destination, image!);
    if (task == null) return;
    final snapshot = await task!.whenComplete(() {});
    urlDownloadLink = await snapshot.ref.getDownloadURL();
    setState(() {
      downloadLink = urlDownloadLink;
    });
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
      );

      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      // print("Failed to pick image: $e");
    }
  }

  String randomNumberGenerator() {
    final String num = Random().nextInt(1000).toString();
    return num;
  }

  Future<void> uploadInfo() async {
    String newId = randomNumberGenerator();

    await uploadImage();
    try {
      // int num = Random().nextInt(100);

      await _firestore.collection("Prescription").doc(newId).set({
        "ColumnId": newId,
        "email": "email",
        "datetime": DateTime.now(),
        "prescriptionimage": downloadLink ?? "true",
        "description": descriptionController.text
      });
      showNotification(
          title: 'Prescription',
          message: 'Your Prescription is successfully uploaded',
          id: 0);
    } catch (e) {
      print(e.toString() + " 00000000000000");
    }
  }

  @override
  Widget build(BuildContext context) {
    bool buttonDisability = false;
    return Scaffold(
      key: formkey,
      backgroundColor: const Color(0xff192442),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    GestureDetector(
                      onTap: image != null
                          ? () async {}
                          : () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                      child: RoundedButton(
                                        title: 'Pick from Gallery',
                                        colour: const Color(0xff192442),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          pickImage(ImageSource.gallery);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: RoundedButton(
                                        title: 'Pick from Camera',
                                        colour: const Color(0xff192442),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          pickImage(ImageSource.camera);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              );
                            },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width / 2,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            // shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20)),
                        child: image != null
                            ? Image.file(
                                image!,
                                height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width / 2,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "Assets/ph.png",
                                height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width / 2,
                                fit: BoxFit.contain,
                              ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 30),
                      child: TextFormField(
                        controller: descriptionController,
                        style: const TextStyle(color: Colors.white),
                        maxLines: 3,
                        onChanged: (value) {
                          // updateDescription();
                          description = value.trim();
                        },
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusColor: Colors.white,
                          labelStyle: TextStyle(color: Colors.white),
                          alignLabelWithHint: true,
                          fillColor: Colors.white,
                          labelText: 'Description',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 20),
                    GestureDetector(
                      onTap: buttonDisability == false
                          ? () async {
                              if (description == null) {
                                return showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        title: const Text(
                                          "Validation",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                        content: const Text(
                                          "Please write Description",
                                          style:
                                              TextStyle(color: Colors.black54),
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
                                  buttonDisability = true;
                                  _indicatorBar = true;
                                });
                                await uploadInfo();
                                Navigator.pop(context);
                              }
                            }
                          : null,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white),
                        child: const Center(
                          child: Text(
                            "Upload Description",
                            style: TextStyle(color: Color(0xff192442)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Center(
              //   height: double.infinity,
              child: Visibility(
                  visible: _indicatorBar,
                  child: const CircularProgressIndicator(
                    color: Colors.grey,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class FirebaseApi {
  static UploadTask? uploadFile(String destination, File image) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      return ref.putFile(image);
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }
}

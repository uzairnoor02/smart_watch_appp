// import 'package:flutter/material.dart';
//
// import 'dart:io';
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:file_picker/file_picker.dart';
// import 'package:get/get.dart';
//
// class UnlimitedUploadForImages extends GetxController {
//   var numberOfUploads = "Waiting for images to upload:".obs;
//   final _firestore = FirebaseFirestore.instance;
//   final _auth = FirebaseAuth.instance;
//   String? downloadLink;
//   String get numberUploads_result => numberOfUploads.value;
//
//   // user chose images
//   Future<String?> startUploading({
//     required String myName,
//     required String senderName,
//     required String userId,
//     required String image,
//     required Function(bool) callback,
//     required String chatID,
//     required String reveresedChatid,
//   }) async {
//     //This Urls will be images urls generated after successful upload of files
//     List<String> imgUrls = [];
//
//     FilePickerResult? results = await selectImages();
//
//     //this will return all images after selected by user
//     // FilePickerResult? results = await FilePicker.platform.pickFiles(
//     //     allowMultiple: true,
//     //     allowedExtensions: ['pdf','mp3','mp4'],
//     //   type: FileType.custom
//     // );
//     if (results != null) {
//       callback(true);
//       //Logic to Upload all result to firebase same time
//       List<String?> allPathsResult = results.paths;
//       // Convert them to List Paths
//       List<File> ResultFiles =
//           allPathsResult.map((stringPath) => File(stringPath!)).toList();
//       File fileEach;
//       //Loop Through ResultFiles and upload Each
//       for (fileEach in ResultFiles) {
//         String? fileName = await generateFileName();
//         //this will be File to bytes
//         var assets = fileEach.readAsBytesSync();
//         //Generate a meta data
//         final metadata = firebase_storage.SettableMetadata(
//             contentType: 'png',
//             customMetadata: {'picked-file-path': fileEach.path});
//         //we are uploading image to Firebase
//         firebase_storage.Reference storageReference =
//             firebase_storage.FirebaseStorage.instance
//                 .ref(
//                   'chatimages',
//                 )
//                 .child(fileName!);
//         await storageReference.putData(assets, metadata).then((value) async {
//           String downloadUrl = await value.ref.getDownloadURL();
//           print("links for your uploaded Image: ${downloadUrl}");
//           //Add Download Urls to ArrayList
//           imgUrls.add(downloadUrl);
//
//           _firestore.collection("messages").doc(chatID).collection('msg').add({
//             'text': downloadUrl,
//             'textType': 'image',
//             "Name": myName,
//             "dateTime": DateTime.now().millisecondsSinceEpoch,
//             "userid": userId,
//           });
//           _firestore
//               .collection("messages")
//               .doc(reveresedChatid)
//               .collection('msg')
//               .add({
//             'text': downloadUrl,
//             'textType': 'image',
//             "Name": myName,
//             "dateTime": DateTime.now().millisecondsSinceEpoch,
//             "userid": userId,
//           });
//           _firestore
//               .collection("recentchat")
//               .doc(_auth.currentUser!.uid)
//               .collection("myuid")
//               .add({
//             "myid": userId,
//             "sender": _auth.currentUser!.email,
//             "Name": senderName,
//             "dateTime": DateTime.now().millisecondsSinceEpoch,
//             "profile": image,
//             "message": downloadUrl,
//             "messageType": "image",
//           });
//
//           _firestore
//               .collection("recentchat")
//               .doc(userId)
//               .collection("myuid")
//               .add({
//             "myid": _auth.currentUser!.uid,
//             "senderemail": _auth.currentUser!.email,
//             "Name": _auth.currentUser!.displayName,
//             "dateTime": DateTime.now().millisecondsSinceEpoch,
//             "profile": _auth.currentUser!.photoURL,
//             "message": downloadUrl,
//             "messageType": "image",
//           });
//         });
//       }
//       callback(false);
//
//       //we also need to tell the user that all pdf have been uploaded
//       numberOfUploads.value = "Successfully ${imgUrls.length} Uploaded";
//     } else {}
//   }
//
//   //this function Enable the user to select images
//   Future<FilePickerResult?> selectImages() async {
//     FilePickerResult? results = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         allowedExtensions: [
//           // 'png','jpg'
//           // 'docx',
//           // 'doc',
//           // 'xlsx',
//           // 'xls',
//           // 'pptx',
//           // 'ppt',
//           // 'pdf',
//           // 'txt',
//         ], //'pdf','mp3','mp4',
//         type: FileType.image);
//     return results;
//   }
// }
//
// Future<String?> generateFileName() async {
//   var randomNumber = new Random();
//   String randomName = '';
//   String fileName = '';
//   for (var i = 0; i < 20; i++) {
//     print(randomNumber.nextInt(100));
//     randomName += randomNumber.nextInt(100).toString();
//   }
//   fileName = "${randomName}.png";
//   return fileName;
// }

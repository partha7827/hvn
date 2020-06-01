import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double aspectRatio(BuildContext context) =>
    screenWidth(context) / screenHeight(context);
bool portraitOrientation(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait;

String mediaTimeFormatter(Duration d) =>
    d.toString().split('.').first.padLeft(8, '0');

Future<String> uploadFile(File file, String childName,
    {String fileName = ''}) async {
  if (Platform.isAndroid) {
    await checkStoragePermission();
  }
  try {
    final fileNameWithExtention = (fileName.isEmpty
            ? DateTime.now().millisecondsSinceEpoch.toString()
            : fileName) +
        '.' +
        file.path.split('.').last;
    final task = FirebaseStorage.instance
        .ref()
        .child(childName)
        .child(fileNameWithExtention)
        .putFile(file);
    final snap = await task.onComplete;

    return await snap.ref.getDownloadURL();
  } catch (e) {
    print("Exception $e");

    return null;
  }
}

Future<bool> checkStoragePermission() async {
  return true;
}

void showSnackBarMsg(ScaffoldState scaffoldState, String message) {
  scaffoldState.showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        message,
        style: Theme.of(scaffoldState.context)
            .textTheme
            .subtitle2
            .copyWith(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

DateTime getDateTime(dynamic dateTime) {
  return (dateTime is Timestamp)
      ? dateTime.toDate()
      : dateTime is int
          ? DateTime.fromMillisecondsSinceEpoch(dateTime)
          : dateTime is Map
              ? DateTime.fromMicrosecondsSinceEpoch(dateTime['_seconds'])
              : (dateTime as DateTime);
}

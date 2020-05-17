import 'package:flutter/widgets.dart';
import 'package:highvibe/mocks/firebase_auth_mocks_base.dart';
import 'package:mock_cloud_firestore/mock_cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double aspectRatio(BuildContext context) =>
    screenWidth(context) / screenHeight(context);

String mediaTimeFormarter(Duration d) =>
    d.toString().split('.').first.padLeft(8, '0');

dynamic getMockFirestore() => MockCloudFirestore(mockDatabase);

dynamic getMockAuth() => MockFirebaseAuth(signedIn: true);

dynamic getFirestoreInstance() => Firestore.instance;

dynamic getAuthInstance() => FirebaseAuth.instance;

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

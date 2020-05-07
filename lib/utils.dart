import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

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

Future<String> uploadFile(File file, String childName,
    {String fileName = ''}) async {
  if (Platform.isAndroid) {
    await checkStoragePermission();
  }
  try {
    final fileNameWithExtention = (fileName.isEmpty
            ? DateTime.now().millisecondsSinceEpoch.toString()
            : fileName) +
       '.'+ file.path.split('.').last;
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

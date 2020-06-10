import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/values/global_key.dart';

double aspectRatio(BuildContext context) =>
    screenWidth(context) / screenHeight(context);

Future<bool> checkStoragePermission() async {
  return true;
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

String mediaTimeFormatter(Duration d) =>
    d.toString().split('.').first.padLeft(8, '0');

Future<bool> onWillPop() async {
  if (audioKey.currentState != null &&
      audioKey.currentState.controller != null) {
    if (!audioKey.currentState.controller.isMinimized) {
      await audioKey.currentState.controller.player.stop();
      MediaOverlays.disposeAudioOverlayEntry();
      return false;
    }
  }
  return true;
}

bool isWebUrl(String path) => Uri.parse(path).host != null;

void popUntil({
  @required int numberOfPops,
  BuildContext context,
}) {
  var count = 0;
  Navigator.popUntil(context, (route) {
    return count++ == numberOfPops;
  });
}

bool portraitOrientation(BuildContext context) =>
    MediaQuery.of(context).orientation == Orientation.portrait;

double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

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
    var fileNameWithExtention = fileName.isEmpty
        ? DateTime.now().millisecondsSinceEpoch.toString()
        : fileName;
    fileNameWithExtention =
        '$fileNameWithExtention.${file.path.split('.').last}';

    final task = FirebaseStorage.instance
        .ref()
        .child(childName)
        .child(fileNameWithExtention)
        .putFile(file);
    final snap = await task.onComplete;

    return await snap.ref.getDownloadURL();
  } catch (e) {
    print('Exception $e');

    return null;
  }
}

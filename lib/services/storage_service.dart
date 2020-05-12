import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StorageService extends Disposable {
  // ignore: unused_field
  final _storage = FirebaseStorage.instance;

  Future<String> _uploadFile(File file, String childName,
      {String fileName = ''}) async {
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

  Future<String> uploadUserPhoto(File photo, String userId) async {
    return _uploadFile(photo, "/user/$userId/Pictures/");
  }

  Future<String> uploadUserAudio(File audio, String userId) async {
    return _uploadFile(audio, "/User/$userId/Audio/");
  }

  @override
  void dispose() {}
}

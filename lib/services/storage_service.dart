import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/mocks/firebase_storage_mocks_base.dart';

class StorageService extends Disposable {
  StorageReference avatarStorage;
  StorageReference audioStorage;
  StorageReference audioThumbStorage;

  StorageService(FirebaseStorage storage) {
    avatarStorage = storage.ref().child('avatar');
    audioStorage = storage.ref().child('audio');
    audioThumbStorage = storage.ref().child('audiothumb');
  }

  factory StorageService.withFirebase() =>
      StorageService(FirebaseStorage.instance);

  factory StorageService.withMock() => StorageService(MockFirebaseStorage());

  Future<String> uploadAvatar(File file, String userId) async {
    final snapshot = await avatarStorage.putFile(file).onComplete;
    
    return (await snapshot.ref.getDownloadURL()).toString();
  }

  Future<String> uploadAudio(File file, String userId) async {
    final snapshot = await audioStorage.putFile(file).onComplete;

    return (await snapshot.ref.getDownloadURL()).toString();
  }

  Future<String> uploadAudioThumb(File file, String audioId) async {
    final snapshot = await audioThumbStorage.putFile(file).onComplete;

    return (await snapshot.ref.getDownloadURL()).toString();
  }

  @override
  void dispose() {}
}

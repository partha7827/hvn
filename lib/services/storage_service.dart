import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show required;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/mocks/firebase_storage_mocks_base.dart';

class StorageService extends Disposable {
  StorageReference avatarStorage;
  StorageReference audioStorage;
  StorageReference audioThumbStorage;
  StorageReference playlistsCovers;

  StorageService(FirebaseStorage storage) {
    avatarStorage = storage.ref().child('avatar');
    audioStorage = storage.ref().child('audio');
    audioThumbStorage = storage.ref().child('audiothumb');
    playlistsCovers = storage.ref().child('playlists_covers');
  }

  factory StorageService.withFirebase() =>
      StorageService(FirebaseStorage.instance);

  factory StorageService.withMock() => StorageService(MockFirebaseStorage());

  @override
  void dispose() {
    // TODO:- Do we really need it?
  }

  Future<String> uploadAudio(File file, String userId) async {
    final snapshot = await audioStorage.putFile(file).onComplete;
    return (await snapshot.ref.getDownloadURL()).toString();
  }

  Future<String> uploadAudioThumb(File file, String audioId) async {
    final snapshot = await audioThumbStorage.putFile(file).onComplete;
    return (await snapshot.ref.getDownloadURL()).toString();
  }

  Future<String> uploadAvatar(File file, String userId) async {
    final snapshot = await avatarStorage.putFile(file).onComplete;
    return (await snapshot.ref.getDownloadURL()).toString();
  }

  Future<String> uploadPlaylistCover({@required File file}) async {
    final snapshot = await playlistsCovers.putFile(file).onComplete;
    return (await snapshot.ref.getDownloadURL()).toString();
  }
}

import 'dart:io';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show required;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/mocks/firebase_storage_mocks_base.dart';
import 'package:universal_html/html.dart' as html;
import 'package:uuid/uuid.dart';

class StorageService extends Disposable {
  StorageReference avatarStorage;
  StorageReference audioFilesStorage;
  StorageReference audioThumbStorage;
  StorageReference playlistsCovers;
  StorageReference audioCovers;

  StorageService(FirebaseStorage storage) {
    avatarStorage = storage.ref().child('avatar');
    audioFilesStorage = storage.ref().child('audio_files');
    audioThumbStorage = storage.ref().child('audiothumb');
    audioCovers = storage.ref().child('audio_covers');
    playlistsCovers = storage.ref().child('playlists_covers');
  }

  factory StorageService.withFirebase() =>
      StorageService(FirebaseStorage.instance);

  factory StorageService.withMock() => StorageService(MockFirebaseStorage());

  @override
  void dispose() {}

  Future<String> uploadAudio(File file, String userId) async {
    final snapshot = await audioFilesStorage.putFile(file).onComplete;
    return (await snapshot.ref.getDownloadURL()).toString();
  }

  Future<String> uploadAudioCoverFromWeb({@required html.File image}) async {
    final uuid = Uuid().v4();
    final storageRef = fb.storage().ref('audio_covers/${uuid}_${image.name}');
    final uploadTaskSnapshot = await storageRef.put(image).future;
    return (await uploadTaskSnapshot.ref.getDownloadURL()).toString();
  }

  Future<String> uploadAudioFileFromWeb({@required html.File audio}) async {
    final uuid = Uuid().v4();
    final storageRef = fb.storage().ref('audio_files/${uuid}_${audio.name}');
    final uploadTaskSnapshot = await storageRef.put(audio).future;
    return (await uploadTaskSnapshot.ref.getDownloadURL()).toString();
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

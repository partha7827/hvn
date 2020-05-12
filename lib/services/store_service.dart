import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show User, AudioFile;

class StoreService extends Disposable {
  final _firestore = Firestore.instance;

  CollectionReference get _userCollection => _firestore.collection("users");
  CollectionReference get _audioCollection => _firestore.collection("audios");
  CollectionReference get _tagsCollection => _firestore.collection("tags");

  DocumentReference _userDocument(String userId) =>
      _userCollection.document(userId);

  DocumentReference _audioDocument(String audioId) =>
      _audioCollection.document(audioId);

  // ignore: unused_element
  DocumentReference _tagDocument(String tagId) =>
      _tagsCollection.document(tagId);

  Future<void> addAudioFile(String currentUserId, AudioFile audio) async {
    final audioDocument = await _audioDocument(audio.id);

    final json = jsonDecode(audio.toJson());

    await audioDocument.setData(json);

    await _userDocument(currentUserId).updateData({
      'audioFiles': FieldValue.arrayUnion([audio.id]),
    });
  }

  Future<AudioFile> fetchAudioFile(String id) async {
    final audioDocument = await _audioDocument(id).get();
    return audioDocument.exists
        ? AudioFile.fromJson(jsonEncode(audioDocument.data))
        : null;
  }

  Future<BuiltList<AudioFile>> fetchAudioFilesByTag(String tag) async {
    final snapshot = await (_audioCollection
        .where('tags', arrayContains: tag)
        .getDocuments());
    final audioDocuments = snapshot.documents.map((doc) => doc.data);
    return AudioFile.parseListOfAudioFiles(jsonEncode(audioDocuments));
  }

  Future<User> fetchUserData(String userId) async {
    final doc = await _userDocument(userId).get();
    final jsonString = jsonEncode(doc.data);
    return doc.exists ? User.fromJson(jsonString) : null;
  }

  Future<void> createNewUser(User user) async {
    final userDoc = _userDocument(user.id);
    if ((await userDoc.get()).data == null) {
      final json = jsonDecode(user.toJson());
      await userDoc.setData(json);
    }
  }

  Stream<User> getUserStream(String userId) {
    final response = _userDocument(userId).snapshots();
    return response.map((s) {
      final jsonStrng = jsonEncode(s.data);
      return User.fromJson(jsonStrng);
    });
  }

  Future<void> setUserActive(String userId, bool isActive) {
    return _userDocument(userId).updateData({
      "isOnline": isActive,
      // "lastTimeSeen": DateTime.now().toUtc(),
    });
  }

  Future<void> updateUserInfo(User user) {
    final json = jsonDecode(user.toJson());
    return _userDocument(user.id).updateData(json);
  }

  Future<void> followUser(String currentUserId, String otherId) async {
    await _userDocument(currentUserId).updateData({
      "following": FieldValue.arrayUnion([otherId]),
    });
    await _userDocument(otherId).updateData({
      "followers": FieldValue.arrayUnion([currentUserId])
    });
  }

  Future<void> unfollowUser(String currentUserId, String otherId) async {
    await _userDocument(currentUserId).updateData({
      'following': FieldValue.arrayRemove([otherId]),
    });
    await _userDocument(otherId).updateData({
      "followers": FieldValue.arrayRemove([currentUserId]),
    });
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

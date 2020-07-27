import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show required;
import 'package:highvibe/models/models.dart'
    show PlayList, PlaylistPlusFirestore;
import 'package:highvibe/modules/playlist/api/firebase_playlist_api_path.dart';
import 'package:highvibe/modules/playlist/api/playlist_service.dart';

class FirestorePlaylistService implements PlaylistService {
  final String userId;
  final _firestore = Firestore.instance;

  FirestorePlaylistService({this.userId});

  @override
  Future<void> deletePlaylist({@required PlayList playlist}) async {
    await _firestore
        .collection(FirebasePlaylistApiPath.allPlaylists())
        .document(playlist.id)
        .delete();
  }

  @override
  Future<List<PlayList>> playlistCollectionStream() async {
    final _playList = List<PlayList>.from([]);

    final querySnapshot = await _firestore
        .collection(FirebasePlaylistApiPath.allPlaylists())
        .where('userId', isEqualTo: userId)
        .getDocuments();

    for (var i = 0; i < querySnapshot.documents.length; i++) {
      final documentSnapshot = querySnapshot.documents[i];
      _playList.add(
        PlaylistPlusFirestore.fromMap(
            documentSnapshot.data, documentSnapshot.documentID),
      );
    }

    return _playList;
  }

  @override
  Future<List<PlayList>> fetchPublicPlaylists() async {
    final _playList = List<PlayList>.from([]);

    final querySnapshot = await _firestore
        .collection(FirebasePlaylistApiPath.allPlaylists())
        .where('privacy', isEqualTo: 'public')
        .getDocuments();

    for (var i = 0; i < querySnapshot.documents.length; i++) {
      final documentSnapshot = querySnapshot.documents[i];
      _playList.add(
        PlaylistPlusFirestore.fromMap(
            documentSnapshot.data, documentSnapshot.documentID),
      );
    }

    return _playList;
  }

  @override
  Future<PlayList> playlistStream({String playlistId}) async {
    final document = await _firestore
        .collection(FirebasePlaylistApiPath.allPlaylists())
        .document(playlistId)
        .get();

    return PlaylistPlusFirestore.fromMap(document.data, document.documentID);
  }

  @override
  Future<void> setPlaylist({@required PlayList playlist}) async {
    return _firestore
        .collection(FirebasePlaylistApiPath.allPlaylists())
        .document(playlist.id)
        .setData(playlist.toMap());
  }
}

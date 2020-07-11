import 'package:flutter/foundation.dart' show required;
import 'package:highvibe/models/models.dart'
    show PlayList, PlaylistPlusFirestore;
import 'package:highvibe/modules/playlist/api/firebase_playlist_api_path.dart';
import 'package:highvibe/modules/playlist/api/playlist_service.dart';
import 'package:highvibe/services/firestore_api_service.dart';

class FirestorePlaylistService implements PlaylistService {
  final String userId;
  final _service = FirestoreApiService.instance;

  FirestorePlaylistService({@required this.userId}) : assert(userId != null);

  @override
  Future<void> deletePlaylist({@required PlayList playlist}) async {
    return _service.deleteData(
      path: FirebasePlaylistApiPath.playlist(userId, playlist.id),
    );
  }

  @override
  Stream<List<PlayList>> playlistCollectionStream() {
    return _service.collectionStream(
      path: FirebasePlaylistApiPath.playlistItems(userId),
      builder: (data, documentId) {
        return PlaylistPlusFirestore.fromMap(data, documentId);
      },
    );
  }

  @override
  Stream<PlayList> playlistStream({String playlistId}) {
    return _service.documentStream(
      path: FirebasePlaylistApiPath.playlist(userId, playlistId),
      builder: (data, documentId) {
        return PlaylistPlusFirestore.fromMap(data, documentId);
      },
    );
  }

  @override
  Future<void> setPlaylist({@required PlayList playlist}) async {
    return _service.setData(
      path: FirebasePlaylistApiPath.playlist(userId, playlist.id),
      data: playlist.toMap(),
    );
  }
}

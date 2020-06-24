import 'package:flutter/foundation.dart' show required;
import 'package:highvibe/models/playlist/playlist.dart';

abstract class PlaylistService {
  Future<void> setPlaylist(PlayList playlist);
  Future<void> deletePlaylist(PlayList playlist);
  Stream<List<PlayList>> playlistCollectionStream();
  Stream<PlayList> playlistStream({@required String playlistId});
}

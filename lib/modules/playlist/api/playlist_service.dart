import 'package:flutter/foundation.dart' show required;
import 'package:highvibe/models/playlist/playlist.dart';

abstract class PlaylistService {
  Future<void> deletePlaylist({@required PlayList playlist});
  Future<List<PlayList>> playlistCollectionStream();
  Future<PlayList> playlistStream({@required String playlistId});
  Future<void> setPlaylist({@required PlayList playlist});
  Future<List<PlayList>> fetchPublicPlaylists();
}

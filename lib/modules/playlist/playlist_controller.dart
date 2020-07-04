import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';
import 'package:mobx/mobx.dart';

part 'playlist_controller.g.dart';

class PlaylistController = _PlaylistControllerBase with _$PlaylistController;

abstract class _PlaylistControllerBase with Store {
  final _firestorePlaylistService = Modular.get<FirestorePlaylistService>();

  @action
  Future<void> deletePlaylistCover({@required PlayList playlist}) async {
    print('DELETE PLAYLIST');
    await _firestorePlaylistService.deletePlaylist(playlist: playlist);
  }
}

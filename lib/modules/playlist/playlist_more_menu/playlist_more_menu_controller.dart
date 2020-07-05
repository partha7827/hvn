import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';
import 'package:mobx/mobx.dart';

part 'playlist_more_menu_controller.g.dart';

class PlaylistMoreMenuController = _PlaylistMoreMenuControllerBase
    with _$PlaylistMoreMenuController;

abstract class _PlaylistMoreMenuControllerBase with Store {
  final _firestorePlaylistService = Modular.get<FirestorePlaylistService>();

  @action
  Future<void> deletePlaylistCover({@required PlayList playlist}) async {
    try {
      await _firestorePlaylistService.deletePlaylist(playlist: playlist);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

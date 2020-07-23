import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';
import 'package:mobx/mobx.dart';

part 'show_playlists_controller.g.dart';

class ShowPlaylistsController = _ShowPlaylistsControllerBase
    with _$ShowPlaylistsController;

abstract class _ShowPlaylistsControllerBase with Store {
  final _firestorePlaylistService = Modular.get<FirestorePlaylistService>();

  Future<List<PlayList>> fetchPlaylists() {
    return _firestorePlaylistService.playlistCollectionStream();
  }
}

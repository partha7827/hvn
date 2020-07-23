import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';
import 'package:mobx/mobx.dart';
part 'discover_playlists_controller.g.dart';

class DiscoverPlaylistsController = _DiscoverPlaylistsControllerBase
    with _$DiscoverPlaylistsController;

abstract class _DiscoverPlaylistsControllerBase with Store {
  final _firestorePlaylistService = Modular.get<FirestorePlaylistService>();

  Future<List<PlayList>> fetchPublicPlaylists() {
    return _firestorePlaylistService.fetchPublicPlaylists();
  }
}

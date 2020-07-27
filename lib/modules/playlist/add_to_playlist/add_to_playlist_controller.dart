import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';
import 'package:mobx/mobx.dart';

part 'add_to_playlist_controller.g.dart';

class AddToPlaylistController = _AddToPlaylistControllerBase
    with _$AddToPlaylistController;

abstract class _AddToPlaylistControllerBase with Store {
  final _firestorePlaylistService = Modular.get<FirestorePlaylistService>();
  final _appController = Modular.get<AppController>();

  Audio audioFile;

  final Set<PlayList> _listOfPlaylistToAddAudio = {};

  _AddToPlaylistControllerBase(this.audioFile);

  PlayList _addAudioFileToPlaylist({@required PlayList playlist}) {
    final temporarilyPlaylist = <Audio>[];

    if (playlist.audioFiles.isNotEmpty) {
      temporarilyPlaylist.addAll(playlist.audioFiles.asList());
    }

    temporarilyPlaylist.add(audioFile);

    return PlayList(
      (b) => b
        ..id = playlist.id
        ..coverUrlPath = playlist.coverUrlPath
        ..description = playlist.description
        ..title = playlist.title
        ..privacy = playlist.privacy
        ..audioFiles =
            BuiltSet<Audio>.from(temporarilyPlaylist).toBuiltList().toBuilder()
        ..userId = _appController.currentUser.id,
    );
  }

  Future<List<PlayList>> fetchPlaylists() async {
    return _firestorePlaylistService.playlistCollectionStream();
  }

  Future<List<PlayList>> findPlaylists({
    List<PlayList> items,
    String searchTerm,
  }) async {
    return items.where((item) => item.title.startsWith(searchTerm)).toList();
  }

  Future<void> _updatePlaylist({@required PlayList playlist}) async {
    try {
      await _firestorePlaylistService.setPlaylist(playlist: playlist);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @action
  void populatePlaylistItems({@required PlayList playlist}) {
    if (_listOfPlaylistToAddAudio.contains(playlist)) {
      _listOfPlaylistToAddAudio.remove(playlist);
    } else {
      _listOfPlaylistToAddAudio.add(playlist);
    }
    print(_listOfPlaylistToAddAudio);
  }

  @action
  Future<void> saveAudioToPlaylists() async {
    for (final item in _listOfPlaylistToAddAudio) {
      final updatedPlaylist = _addAudioFileToPlaylist(playlist: item);
      await _updatePlaylist(playlist: updatedPlaylist);
    }
  }
}

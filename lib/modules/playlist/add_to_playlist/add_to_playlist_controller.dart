import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';
import 'package:mobx/mobx.dart';

part 'add_to_playlist_controller.g.dart';

class AddToPlaylistController = _AddToPlaylistControllerBase
    with _$AddToPlaylistController;

abstract class _AddToPlaylistControllerBase with Store {
  final _firestorePlaylistService = Modular.get<FirestorePlaylistService>();

  Audio audioFile;

  @observable
  Set<PlayList> listOfPlaylistToAddAudio = {};

  _AddToPlaylistControllerBase(this.audioFile);

  @action
  void addAudioFileToPlaylist({@required PlayList playlist}) {
    final temporarilyPlaylist = <Audio>[];

    if (playlist.audioFiles.isNotEmpty) {
      temporarilyPlaylist.addAll(playlist.audioFiles.asList());
    }

    temporarilyPlaylist.add(audioFile);

    final updatedPlaylist = PlayList(
      (b) => b
        ..coverUrlPath = playlist.coverUrlPath
        ..description = playlist.description
        ..title = playlist.title
        ..privacy = playlist.privacy
        ..audioFiles =
            BuiltSet<Audio>.from(temporarilyPlaylist).toBuiltList().toBuilder(),
    );

    // tempInMemoryPlaylistCollection.remove(playlist);
    // tempInMemoryPlaylistCollection.add(updatedPlaylist);
  }

  @action
  Future<List<PlayList>> findPlaylists(String searchTerm) async {
    return listOfPlaylistToAddAudio
        .where(
          (element) => element.title.startsWith(searchTerm),
        )
        .toList();
  }

  @action
  Future<void> init() async {
    await _firestorePlaylistService.playlistCollectionStream().forEach(
      (element) {
        listOfPlaylistToAddAudio.addAll(element);
      },
    );
  }

  @action
  void populatePlaylistItems({@required PlayList playlist}) {
    if (listOfPlaylistToAddAudio.contains(playlist)) {
      listOfPlaylistToAddAudio.remove(playlist);
    } else {
      listOfPlaylistToAddAudio.add(playlist);
    }
  }

  @action
  Future<void> saveAudioToPlaylists() async {
    for (final item in listOfPlaylistToAddAudio) {
      //addAudioFileToPlaylist(item);
    }
  }
}

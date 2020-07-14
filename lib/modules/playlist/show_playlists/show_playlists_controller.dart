import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
<<<<<<< HEAD
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/firestore_service.dart';
=======
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';
>>>>>>> master
import 'package:mobx/mobx.dart';

part 'show_playlists_controller.g.dart';

class ShowPlaylistsController = _ShowPlaylistsControllerBase
    with _$ShowPlaylistsController;

abstract class _ShowPlaylistsControllerBase with Store {
<<<<<<< HEAD
  final String userId;
  _ShowPlaylistsControllerBase(this.userId);

  final FirestoreService store = Modular.get<FirestoreService>();

  bool get isCurrentUser =>
      Modular.get<AppController>().currentUser.id == userId;

  @action
  void loadPlaylists() {
    playlists = ObservableFuture.value(tempInMemoryPlaylistCollection.toList());

    // playlists = ObservableFuture(
    //   store.playlistCollection
    //       .where('userId', isEqualTo: userId)
    //       .getDocuments()
    //       .then((s) => PlayList.parseListOfPlayLists(s).toList()),
    // );
  }

  @observable
  ObservableFuture<List<PlayList>> playlists;
=======
  final _firestorePlaylistService = Modular.get<FirestorePlaylistService>();

  Stream<List<PlayList>> fetchPlaylists() {
    return _firestorePlaylistService.playlistCollectionStream();
  }
>>>>>>> master
}

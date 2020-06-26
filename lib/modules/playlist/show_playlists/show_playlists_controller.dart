import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:mobx/mobx.dart';

part 'show_playlists_controller.g.dart';

class ShowPlaylistsController = _ShowPlaylistsControllerBase
    with _$ShowPlaylistsController;

abstract class _ShowPlaylistsControllerBase with Store {
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
}

import 'package:mobx/mobx.dart';

part 'open_playlist_controller.g.dart';

class OpenPlaylistController = _OpenPlaylistControllerBase
    with _$OpenPlaylistController;

abstract class _OpenPlaylistControllerBase with Store {
  @observable
  int amount = 1;

  @computed
  int get total => amount + 1;

  @action
  void increment() {
    amount++;
  }
}
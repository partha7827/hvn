import 'package:mobx/mobx.dart';

part 'explore_controller.g.dart';

class ExploreController = _ExploreControllerBase with _$ExploreController;

abstract class _ExploreControllerBase with Store {
  @observable
  bool filesReady = false;

  // List<AudioFile> audios;

  Future<void> findAudiosByTag(String id) async {}
}

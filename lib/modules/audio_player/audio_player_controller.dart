import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/audio_player/audio_player_service.dart';
import 'package:mobx/mobx.dart';

part 'audio_player_controller.g.dart';

class AudioPlayerController = _AudioPlayerControllerBase
    with _$AudioPlayerController;

abstract class _AudioPlayerControllerBase with Store {
  final player = Modular.get<AudioPlayerService>();

  @observable
  bool isLoopMode = false;

  @action
  void switchLoopMode() {
    if (isLoopMode) {
      isLoopMode = false;
      player.disableLoopMode();
    } else {
      isLoopMode = true;
      player.enableLoopMode();
    }
  }
}

import 'package:mobx/mobx.dart';

part 'audio_player_controller.g.dart';

class AudioPlayerController = _AudioPlayerControllerBase
    with _$AudioPlayerController;

abstract class _AudioPlayerControllerBase with Store {}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/modules/audio_player/audio_player_service.dart';
import 'package:mobx/mobx.dart';

part 'audio_player_controller.g.dart';

enum AudioPlayerMode { fullScreen, minimized, none }

class AudioPlayerController = _AudioPlayerControllerBase
    with _$AudioPlayerController;

abstract class _AudioPlayerControllerBase with Store {
  Audio audioFile;
  _AudioPlayerControllerBase(this.audioFile);

  final player = Modular.get<AudioPlayerService>();

  @observable
  AudioPlayerMode audioPlayerMode = AudioPlayerMode.fullScreen;

  @observable
  bool isArtworkVisible;

  @observable
  bool isMinimized;

  @observable
  bool isPlaying;

  @observable
  bool isLoopMode = false;

  @observable
  Duration trackPosition;

  @computed
  String get positionText => trackPosition?.toString()?.split('.')?.first ?? '';

  @computed
  double get sliderPosition => (trackPosition != null &&
          audioFile.duration != null &&
          trackPosition.inMilliseconds > 0 &&
          trackPosition.inMilliseconds < audioFile.duration)
      ? trackPosition.inMilliseconds / audioFile.duration
      : 0;

  @action
  void configure() {
    player.playerStateSubscription.onData((state) {
      isPlaying = player.isPlaying;
    });

    player.positionSubscription.onData((position) {
      if (position >= Duration(milliseconds: audioFile.duration)) {
        trackPosition = Duration(milliseconds: 0);
      } else {
        trackPosition = position;
      }
    });
  }

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

  @action
  void toggleAudioPlayerMode() {
    if (audioPlayerMode != AudioPlayerMode.minimized) {
      audioPlayerMode = AudioPlayerMode.minimized;
    } else {
      audioPlayerMode = AudioPlayerMode.none;
    }
  }

  @action
  void togglePlayStop() {
    isPlaying = !isPlaying;
    player.toggle(playPosition: trackPosition);
  }
}

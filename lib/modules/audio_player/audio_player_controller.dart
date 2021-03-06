import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/services/audio_player_service.dart';
import 'package:mobx/mobx.dart';

part 'audio_player_controller.g.dart';

class AudioPlayerController = _AudioPlayerControllerBase
    with _$AudioPlayerController;

abstract class _AudioPlayerControllerBase with Store {
  final Audio audioFile;
  final AudioPlayerService player = Modular.get<AudioPlayerService>();

  @observable
  AudioPlayerMode audioPlayerMode = AudioPlayerMode.fullScreen;

  @observable
  bool isLoopMode = false;

  @observable
  Duration trackPosition;

  @observable
  AudioPlayerState playerState;

  _AudioPlayerControllerBase(this.audioFile);

  @computed
  bool get isMinimized => audioPlayerMode == AudioPlayerMode.minimized;

  @computed
  bool get isPlaying => playerState == AudioPlayerState.PLAYING;

  @computed
  String get positionText => trackPosition?.toString()?.split('.')?.first ?? '';

  @computed
  double get sliderPosition => (trackPosition != null &&
          audioFile.duration != null &&
          trackPosition.inMilliseconds > 0 &&
          trackPosition.inMilliseconds < audioFile.duration)
      ? trackPosition.inMilliseconds / audioFile.duration
      : 0;

  void disableLoopMode() => player.setReleaseMode(ReleaseMode.RELEASE);

  void enableLoopMode() => player.setReleaseMode(ReleaseMode.LOOP);

  @action
  void init() {
    player.play(audioFile.audioUrlPath);

    player.positionSubscription.onData((position) {
      if (position >= Duration(milliseconds: audioFile.duration)) {
        return trackPosition = const Duration(milliseconds: 0);
      }

      return trackPosition = position;
    });

    player.playerStateSubscription.onData((state) {
      playerState = state;
    });
  }

  void seekToPosition(double value) => player.seek(Duration(
        milliseconds: (value * audioFile.duration).round(),
      ));

  void skip15Seconds({
    AudioPlayerSkipButtonType buttonType,
    Duration trackPosition,
  }) =>
      buttonType == AudioPlayerSkipButtonType.fastForward
          ? player.seek(trackPosition + const Duration(seconds: 15))
          : player.seek(trackPosition - const Duration(seconds: 15));

  @action
  void toggleAudioPlayerMode() {
    if (audioPlayerMode != AudioPlayerMode.minimized) {
      audioPlayerMode = AudioPlayerMode.minimized;
    } else {
      audioPlayerMode = AudioPlayerMode.none;
    }
  }

  @action
  void toggleLoopMode() {
    if (isLoopMode) {
      disableLoopMode();
    } else {
      enableLoopMode();
    }
  }

  @action
  void togglePlayStop() {
    if (playerState == AudioPlayerState.STOPPED ||
        playerState == AudioPlayerState.COMPLETED) {
      player.play(audioFile.audioUrlPath);
    } else if (playerState == AudioPlayerState.PAUSED) {
      player.resume();
    } else if (playerState == AudioPlayerState.PLAYING) {
      player.pause();
    }
  }

  @override
  void noSuchMethod(Invocation i) => super.noSuchMethod(i);
}

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/services/audio_player_service.dart';
import 'package:mobx/mobx.dart';

part 'open_playlist_controller.g.dart';

class OpenPlaylistController = _OpenPlaylistControllerBase
    with _$OpenPlaylistController;

abstract class _OpenPlaylistControllerBase with Store {
  _OpenPlaylistControllerBase(this.playList);

  final PlayList playList;
  final AudioPlayerService player = Modular.get<AudioPlayerService>();

  @observable
  int index = 0;

  @observable
  AudioPlayerMode audioPlayerMode = AudioPlayerMode.fullScreen;

  @computed
  bool get isMinimized => audioPlayerMode == AudioPlayerMode.minimized;

  @observable
  Duration trackPosition = const Duration(seconds: 0);

  @observable
  AudioPlayerState playerState;

  @computed
  bool get isPlaying => playerState == AudioPlayerState.PLAYING;

  @action
  void init() {
    player.play(playList.audioFiles[index].audioUrlPath);

    player.positionSubscription.onData((position) {
      if (position >=
          Duration(milliseconds: playList.audioFiles[index].duration)) {
        return trackPosition = const Duration(milliseconds: 0);
      }

      return trackPosition = position;
    });

    player.playerStateSubscription.onData((state) {
      playerState = state;
    });
  }

  void seekToPosition(double value) => player.seek(Duration(
        milliseconds: (value * playList.audioFiles[index].duration).round(),
      ));

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
    if (playerState == AudioPlayerState.STOPPED ||
        playerState == AudioPlayerState.COMPLETED) {
      player.play(playList.audioFiles[index].audioUrlPath);
    } else if (playerState == AudioPlayerState.PAUSED) {
      player.resume();
    } else if (playerState == AudioPlayerState.PLAYING) {
      player.pause();
    }
  }

  @action
  void setCurrentPlayingAudioIndex(int audioIndex) {
    index = audioIndex;
  }

  @action
  void playNextTrack() {
    if (index < playList.audioFiles.length - 1) {
      player.stop();
      player.play(playList.audioFiles[++index].audioUrlPath);
    }
  }

  @action
  void playPreviousTrack() {
    if (index > 0) {
      player.stop();
      player.play(playList.audioFiles[--index].audioUrlPath);
    }
  }

  @computed
  double get sliderPosition => (trackPosition != null &&
          playList != null &&
          playList.audioFiles != null &&
          playList.audioFiles[index] != null &&
          playList.audioFiles[index].duration != null &&
          trackPosition.inMilliseconds > 0 &&
          trackPosition.inMilliseconds < playList.audioFiles[index].duration)
      ? trackPosition.inMilliseconds / playList.audioFiles[index].duration
      : 0;
}

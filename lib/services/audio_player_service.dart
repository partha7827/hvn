import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/mocks/audio_player_mock.dart';

enum AudioPlayerMode { fullScreen, minimized, none }

enum AudioPlayerSkipButtonType { fastForward, rewind }

class AudioPlayerService extends Disposable {
  final AudioPlayer audioPlayer;

  StreamSubscription<Duration> positionSubscription;
  StreamSubscription<AudioPlayerState> playerStateSubscription;

  AudioPlayerService(this.audioPlayer) {
    positionSubscription =
        audioPlayer.onAudioPositionChanged.listen((event) {});

    playerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((event) {});
  }

  factory AudioPlayerService.withPlayer() => AudioPlayerService(
        AudioPlayer(),
      );

  factory AudioPlayerService.withMock() => AudioPlayerService(
        AudioPlayerMock(),
      );

  Future<void> play(String url, {Duration position = Duration.zero}) =>
      audioPlayer.play(url, position: position);

  Future<void> pause() => audioPlayer.pause();

  Future<void> resume() => audioPlayer.resume();

  Future<void> stop() => audioPlayer.stop();

  Future<void> seek(Duration position) => audioPlayer.seek(position);

  Future<void> setReleaseMode(ReleaseMode mode) =>
      audioPlayer.setReleaseMode(mode);

  @override
  void dispose() {
    positionSubscription.cancel();
    playerStateSubscription.cancel();
  }
}

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show required;
import 'package:highvibe/models/models.dart' show Audio;

class AudioPlayerService {
  final AudioPlayer audioPlayer;
  final Audio audioFile;

  StreamSubscription<Duration> positionSubscription;
  StreamSubscription<AudioPlayerState> playerStateSubscription;

  bool get isPlaying => _playerState == PlayerState.playing;

  PlayerState _playerState = PlayerState.stopped;
  // ignore: unused_field
  Duration _position;

  AudioPlayerService({
    AudioPlayer audioPlayer,
    @required this.audioFile,
  }) : audioPlayer = audioPlayer ?? AudioPlayer() {
    _configure();
  }

  void dispose() async {
    await audioPlayer.stop();
    await positionSubscription?.cancel();
    await playerStateSubscription?.cancel();
    await audioPlayer.dispose();
  }

  Future<void> _pause() async {
    final result = await audioPlayer.pause();
    if (result == 1) _playerState = PlayerState.paused;
  }

  Future<void> _play({@required Duration playPosition}) async {
    final result = await audioPlayer.play(
      audioFile.audioUrlPath,
      position: playPosition,
    );

    if (result == 1) _playerState = PlayerState.playing;
  }

  void enableLoopMode() {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  void disableLoopMode() {
    audioPlayer.setReleaseMode(ReleaseMode.RELEASE);
  }

  Future<void> seekToPosition(double value) async {
    final position = value * audioFile.duration;
    await audioPlayer.seek(Duration(milliseconds: position.round()));
  }

  Future<void> skip15seconds({
    @required AudioPlayerSkipButtonType buttonType,
    @required Duration trackPosition,
  }) async {
    if (buttonType == AudioPlayerSkipButtonType.fastForward) {
      trackPosition = trackPosition + const Duration(milliseconds: 15000);
    } else {
      trackPosition = trackPosition - const Duration(milliseconds: 15000);
    }
    await audioPlayer.seek(trackPosition);
  }

  Future<void> stop() async {
    final result = await audioPlayer.stop();
    if (result == 1) {
      _playerState = PlayerState.stopped;
      _position = const Duration();
    }
  }

  void _configure() {
    positionSubscription = audioPlayer.onAudioPositionChanged.listen((p) {
      _position = p;
    });

    audioPlayer.onPlayerCompletion.listen((_) {
      stop();
      _position = Duration(milliseconds: audioFile.duration);
    });

    playerStateSubscription = audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == AudioPlayerState.STOPPED) {
        _playerState = PlayerState.stopped;
      } else if (state == AudioPlayerState.PLAYING) {
        _playerState = PlayerState.playing;
      } else if (state == AudioPlayerState.PAUSED) {
        _playerState = PlayerState.paused;
      } else {
        _playerState = PlayerState.stopped;
      }
    });
  }

  void toggle({@required Duration playPosition}) {
    if (_playerState == PlayerState.stopped) {
      _play(playPosition: playPosition);
      _playerState = PlayerState.playing;
    } else if (_playerState == PlayerState.paused) {
      audioPlayer.resume();
      _playerState = PlayerState.playing;
    } else if (_playerState == PlayerState.playing) {
      _pause();
      _playerState = PlayerState.paused;
    }
  }
}

enum AudioPlayerSkipButtonType { fastForward, rewind }

enum PlayerState { stopped, playing, paused }

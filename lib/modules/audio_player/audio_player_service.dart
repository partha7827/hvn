import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show required;
import 'package:highvibe/models/models.dart' show AudioFile;

class AudioPlayerService {
  final AudioPlayer audioPlayer;
  final AudioFile audioFile;

  StreamSubscription positionSubscription;
  StreamSubscription playerStateSubscription;

  get isPlaying => _playerState == PlayerState.playing;

  PlayerState _playerState = PlayerState.stopped;
  // ignore: unused_field
  Duration _position;

  AudioPlayerService({
    AudioPlayer audioPlayer,
    @required this.audioFile,
  }) : audioPlayer = audioPlayer ?? AudioPlayer() {
    _configure();
  }

  void dispose() {
    audioPlayer.dispose();
    positionSubscription?.cancel();
    playerStateSubscription?.cancel();
  }

  Future<int> _pause() async {
    final result = await audioPlayer.pause();
    if (result == 1) _playerState = PlayerState.paused;
    return result;
  }

  Future<int> _play({@required Duration playPosition}) async {
    final result = await audioPlayer.play(
      audioFile.audioFileUrlPath,
      position: playPosition,
    );

    if (result == 1) _playerState = PlayerState.playing;
    return result;
  }

  Future<void> seekToPosition(double value) async {
    final position = value * audioFile.duration;
    audioPlayer.seek(Duration(milliseconds: position.round()));
  }

  Future<void> skip15seconds({
    @required AudioPlayerSkipButtonType buttonType,
    @required Duration trackPosition,
  }) async {
    if (buttonType == AudioPlayerSkipButtonType.fastForward) {
      trackPosition = trackPosition + Duration(milliseconds: 15000);
    } else {
      trackPosition = trackPosition - Duration(milliseconds: 15000);
    }
    audioPlayer.seek(trackPosition);
  }

  Future<int> stop() async {
    final result = await audioPlayer.stop();
    if (result == 1) {
      _playerState = PlayerState.stopped;
      _position = Duration();
    }
    return result;
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

      print(_playerState);
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AudioPlayerController on _AudioPlayerControllerBase, Store {
  Computed<bool> _$isMinimizedComputed;

  @override
  bool get isMinimized =>
      (_$isMinimizedComputed ??= Computed<bool>(() => super.isMinimized,
              name: '_AudioPlayerControllerBase.isMinimized'))
          .value;
  Computed<bool> _$isPlayingComputed;

  @override
  bool get isPlaying =>
      (_$isPlayingComputed ??= Computed<bool>(() => super.isPlaying,
              name: '_AudioPlayerControllerBase.isPlaying'))
          .value;
  Computed<String> _$positionTextComputed;

  @override
  String get positionText =>
      (_$positionTextComputed ??= Computed<String>(() => super.positionText,
              name: '_AudioPlayerControllerBase.positionText'))
          .value;
  Computed<double> _$sliderPositionComputed;

  @override
  double get sliderPosition =>
      (_$sliderPositionComputed ??= Computed<double>(() => super.sliderPosition,
              name: '_AudioPlayerControllerBase.sliderPosition'))
          .value;

  final _$audioPlayerModeAtom =
      Atom(name: '_AudioPlayerControllerBase.audioPlayerMode');

  @override
  AudioPlayerMode get audioPlayerMode {
    _$audioPlayerModeAtom.reportRead();
    return super.audioPlayerMode;
  }

  @override
  set audioPlayerMode(AudioPlayerMode value) {
    _$audioPlayerModeAtom.reportWrite(value, super.audioPlayerMode, () {
      super.audioPlayerMode = value;
    });
  }

  final _$isLoopModeAtom = Atom(name: '_AudioPlayerControllerBase.isLoopMode');

  @override
  bool get isLoopMode {
    _$isLoopModeAtom.reportRead();
    return super.isLoopMode;
  }

  @override
  set isLoopMode(bool value) {
    _$isLoopModeAtom.reportWrite(value, super.isLoopMode, () {
      super.isLoopMode = value;
    });
  }

  final _$trackPositionAtom =
      Atom(name: '_AudioPlayerControllerBase.trackPosition');

  @override
  Duration get trackPosition {
    _$trackPositionAtom.reportRead();
    return super.trackPosition;
  }

  @override
  set trackPosition(Duration value) {
    _$trackPositionAtom.reportWrite(value, super.trackPosition, () {
      super.trackPosition = value;
    });
  }

  final _$playerStateAtom =
      Atom(name: '_AudioPlayerControllerBase.playerState');

  @override
  AudioPlayerState get playerState {
    _$playerStateAtom.reportRead();
    return super.playerState;
  }

  @override
  set playerState(AudioPlayerState value) {
    _$playerStateAtom.reportWrite(value, super.playerState, () {
      super.playerState = value;
    });
  }

  final _$_AudioPlayerControllerBaseActionController =
      ActionController(name: '_AudioPlayerControllerBase');

  @override
  void init() {
    final _$actionInfo = _$_AudioPlayerControllerBaseActionController
        .startAction(name: '_AudioPlayerControllerBase.init');
    try {
      return super.init();
    } finally {
      _$_AudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleLoopMode() {
    final _$actionInfo = _$_AudioPlayerControllerBaseActionController
        .startAction(name: '_AudioPlayerControllerBase.toggleLoopMode');
    try {
      return super.toggleLoopMode();
    } finally {
      _$_AudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleAudioPlayerMode() {
    final _$actionInfo = _$_AudioPlayerControllerBaseActionController
        .startAction(name: '_AudioPlayerControllerBase.toggleAudioPlayerMode');
    try {
      return super.toggleAudioPlayerMode();
    } finally {
      _$_AudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePlayStop() {
    final _$actionInfo = _$_AudioPlayerControllerBaseActionController
        .startAction(name: '_AudioPlayerControllerBase.togglePlayStop');
    try {
      return super.togglePlayStop();
    } finally {
      _$_AudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
audioPlayerMode: ${audioPlayerMode},
isLoopMode: ${isLoopMode},
trackPosition: ${trackPosition},
playerState: ${playerState},
isMinimized: ${isMinimized},
isPlaying: ${isPlaying},
positionText: ${positionText},
sliderPosition: ${sliderPosition}
    ''';
  }
}

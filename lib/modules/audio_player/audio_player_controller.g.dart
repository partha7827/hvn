// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AudioPlayerController on _AudioPlayerControllerBase, Store {
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

  final _$_AudioPlayerControllerBaseActionController =
      ActionController(name: '_AudioPlayerControllerBase');

  @override
  void switchLoopMode() {
    final _$actionInfo = _$_AudioPlayerControllerBaseActionController
        .startAction(name: '_AudioPlayerControllerBase.switchLoopMode');
    try {
      return super.switchLoopMode();
    } finally {
      _$_AudioPlayerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoopMode: ${isLoopMode}
    ''';
  }
}

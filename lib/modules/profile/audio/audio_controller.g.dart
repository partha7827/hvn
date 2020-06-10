// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AudioController on _AudioControllerBase, Store {
  final _$audiosAtom = Atom(name: '_AudioControllerBase.audios');

  @override
  ObservableFuture<List<Audio>> get audios {
    _$audiosAtom.reportRead();
    return super.audios;
  }

  @override
  set audios(ObservableFuture<List<Audio>> value) {
    _$audiosAtom.reportWrite(value, super.audios, () {
      super.audios = value;
    });
  }

  final _$_AudioControllerBaseActionController =
      ActionController(name: '_AudioControllerBase');

  @override
  void loadAudios() {
    final _$actionInfo = _$_AudioControllerBaseActionController.startAction(
        name: '_AudioControllerBase.loadAudios');
    try {
      return super.loadAudios();
    } finally {
      _$_AudioControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
audios: ${audios}
    ''';
  }
}

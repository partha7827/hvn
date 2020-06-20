// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoController on _VideoControllerBase, Store {
  final _$videosAtom = Atom(name: '_VideoControllerBase.videos');

  @override
  ObservableFuture<List<Video>> get videos {
    _$videosAtom.reportRead();
    return super.videos;
  }

  @override
  set videos(ObservableFuture<List<Video>> value) {
    _$videosAtom.reportWrite(value, super.videos, () {
      super.videos = value;
    });
  }

  final _$_VideoControllerBaseActionController =
      ActionController(name: '_VideoControllerBase');

  @override
  void loadVideos() {
    final _$actionInfo = _$_VideoControllerBaseActionController.startAction(
        name: '_VideoControllerBase.loadVideos');
    try {
      return super.loadVideos();
    } finally {
      _$_VideoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
videos: ${videos}
    ''';
  }
}

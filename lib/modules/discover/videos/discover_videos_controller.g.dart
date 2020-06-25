// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_videos_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DiscoverVideosController on _DiscoverVideosControllerBase, Store {
  final _$videosAtom = Atom(name: '_DiscoverVideosControllerBase.videos');

  @override
  ObservableFuture<BuiltList<Video>> get videos {
    _$videosAtom.reportRead();
    return super.videos;
  }

  @override
  set videos(ObservableFuture<BuiltList<Video>> value) {
    _$videosAtom.reportWrite(value, super.videos, () {
      super.videos = value;
    });
  }

  final _$_DiscoverVideosControllerBaseActionController =
      ActionController(name: '_DiscoverVideosControllerBase');

  @override
  void loadVideos() {
    final _$actionInfo = _$_DiscoverVideosControllerBaseActionController
        .startAction(name: '_DiscoverVideosControllerBase.loadVideos');
    try {
      return super.loadVideos();
    } finally {
      _$_DiscoverVideosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
videos: ${videos}
    ''';
  }
}

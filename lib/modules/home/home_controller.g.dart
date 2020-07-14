// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$audiosAtom = Atom(name: '_HomeControllerBase.audios');

  @override
  ObservableFuture<BuiltList<Audio>> get audios {
    _$audiosAtom.reportRead();
    return super.audios;
  }

  @override
  set audios(ObservableFuture<BuiltList<Audio>> value) {
    _$audiosAtom.reportWrite(value, super.audios, () {
      super.audios = value;
    });
  }

  final _$videosAtom = Atom(name: '_HomeControllerBase.videos');

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

  final _$authorsAtom = Atom(name: '_HomeControllerBase.authors');

  @override
  ObservableFuture<BuiltList<User>> get authors {
    _$authorsAtom.reportRead();
    return super.authors;
  }

  @override
  set authors(ObservableFuture<BuiltList<User>> value) {
    _$authorsAtom.reportWrite(value, super.authors, () {
      super.authors = value;
    });
  }

  final _$logoutAsyncAction = AsyncAction('_HomeControllerBase.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  ObservableFuture<BuiltList<Audio>> loadRecommendedAudios() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.loadRecommendedAudios');
    try {
      return super.loadRecommendedAudios();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableFuture<BuiltList<Video>> loadRecommendedVideos() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.loadRecommendedVideos');
    try {
      return super.loadRecommendedVideos();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  ObservableFuture<BuiltList<User>> loadRecommendedAuthors() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.loadRecommendedAuthors');
    try {
      return super.loadRecommendedAuthors();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
audios: ${audios},
videos: ${videos},
authors: ${authors}
    ''';
  }
}

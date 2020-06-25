// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_playlists_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShowPlaylistsController on _ShowPlaylistsControllerBase, Store {
  final _$playlistsAtom = Atom(name: '_ShowPlaylistsControllerBase.playlists');

  @override
  ObservableFuture<List<PlayList>> get playlists {
    _$playlistsAtom.reportRead();
    return super.playlists;
  }

  @override
  set playlists(ObservableFuture<List<PlayList>> value) {
    _$playlistsAtom.reportWrite(value, super.playlists, () {
      super.playlists = value;
    });
  }

  final _$_ShowPlaylistsControllerBaseActionController =
      ActionController(name: '_ShowPlaylistsControllerBase');

  @override
  void loadPlaylists() {
    final _$actionInfo = _$_ShowPlaylistsControllerBaseActionController
        .startAction(name: '_ShowPlaylistsControllerBase.loadPlaylists');
    try {
      return super.loadPlaylists();
    } finally {
      _$_ShowPlaylistsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playlists: ${playlists}
    ''';
  }
}

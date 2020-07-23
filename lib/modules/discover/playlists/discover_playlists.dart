import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/discover/playlists/discover_playlists_controller.dart';
import 'package:highvibe/modules/discover/playlists/discover_playlists_view.dart';
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';

class DiscoverPlaylists extends WidgetModule {
  DiscoverPlaylists();

  @override
  final List<Bind<Object>> binds = [
    Bind<FirestorePlaylistService>(
      (_) => FirestorePlaylistService(),
    ),
    Bind((i) => DiscoverPlaylistsController()),
  ];

  @override
  Widget get view => const DiscoverPlaylistsView();
}

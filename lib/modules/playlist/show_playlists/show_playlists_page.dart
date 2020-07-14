import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/playlist/widgets/playlist_tile.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'show_playlists_controller.dart';

class ShowPlaylistsPage extends StatefulWidget {
  const ShowPlaylistsPage();

  @override
  _ShowPlaylistsPageState createState() => _ShowPlaylistsPageState();
}

class _ShowPlaylistsPageState
    extends ModularState<ShowPlaylistsPage, ShowPlaylistsController> {
  @override
  void initState() {
    super.initState();
    controller.fetchPlaylists();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PlayList>>(
      stream: controller.fetchPlaylists(),
      builder: (context, snapshot) {
        return ListItemsBuilder<PlayList>(
          snapshot: snapshot,
          itemBuilder: (context, item) {
            return PlaylistTile(
              isInEditMode: false,
              playList: item,
              onTap: (item) => PlaylistModule.toContextMenu(playList: item),
            );
          },
        );
      },
    );
  }
}

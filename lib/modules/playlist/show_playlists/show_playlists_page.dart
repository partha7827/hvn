import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
<<<<<<< HEAD
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/playlist/resources/strings.dart';
import 'package:highvibe/modules/playlist/widgets/playlist_more_menu.dart';
import 'package:highvibe/modules/playlist/widgets/playlist_tile.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/load_widget.dart';
=======
import 'package:highvibe/modules/playlist/widgets/playlist_tile.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
>>>>>>> master
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
<<<<<<< HEAD
    controller.loadPlaylists();
=======
    controller.fetchPlaylists();
>>>>>>> master
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return LoadWidget(
      future: controller.playlists,
      builder: buildPlaylists,
    );
  }

  Widget buildPlaylists(List<PlayList> playlists) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 80, right: 8),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderRow(
              title: playlists.isNotEmpty
                  ? PlaylistStrings.playlists
                  : PlaylistStrings.noPlaylists,
            ),
            if (controller.isCurrentUser)
              GestureDetector(
                onTap: () => PlaylistModule.toCreateNewPlaylist(),
                child: SizedBox(
                  height: 20,
                  width: 120,
                  child: PlaylistImageAssets.newPlaylist,
                ),
              ),
          ],
        ),
        for (final item in playlists)
          PlaylistTile(
            isInEditMode: false,
            playList: item,
            onTap: (item) => playlistContextMenu(context, item),
          ),
      ],
=======
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
>>>>>>> master
    );
  }
}

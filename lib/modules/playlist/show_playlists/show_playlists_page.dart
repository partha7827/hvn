import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/playlist/widgets/playlist_tile.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'show_playlists_controller.dart';

class ShowPlaylistsPage extends StatefulWidget {
  const ShowPlaylistsPage();

  @override
  _ShowPlaylistsPageState createState() => _ShowPlaylistsPageState();
}

class _ShowPlaylistsPageState
    extends ModularState<ShowPlaylistsPage, ShowPlaylistsController> {
  List<PlayList> playLists = [];
  String noPlaylists = '';
  @override
  void initState() {
    super.initState();
    fetchPlayLists();
  }

  void fetchPlayLists() async {
    playLists = await controller.fetchPlaylists();
    setState(() {
      noPlaylists = 'No Playlists available';
    });
  }

  @override
  Widget build(BuildContext context) {
    print('${controller.firestorePlaylistService.userId}');
    print('${controller.appController.currentUser.id}');

    return FutureBuilder<List<PlayList>>(
      future: controller.fetchPlaylists(),
      builder: (context, snapshot) {
        return Column(
          children: <Widget>[
            const SizedBox(height: 12),
            Expanded(
              child: ListItemsBuilder<PlayList>(
                snapshot: snapshot,
                isCurrentUser: controller.firestorePlaylistService.userId ==
                    controller.appController.currentUser.id,
                itemBuilder: (context, item) {
                  return GestureDetector(
                    onTap: () async {
                      MediaOverlays.presentPlayListPlayerAsOverlay(
                        context: context,
                        playList: item,
                      );
                    },
                    child: PlaylistTile(
                      isInEditMode: false,
                      playList: item,
                      onTap: (item) =>
                          PlaylistModule.toContextMenu(playList: item),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

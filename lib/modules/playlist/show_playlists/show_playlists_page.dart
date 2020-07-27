import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/playlist/widgets/playlist_tile.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'package:highvibe/values/themes.dart';
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
    return playLists.isNotEmpty
        ? Column(
            children: <Widget>[
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: playLists.length,
                  itemBuilder: (context, item) {
                    return GestureDetector(
                      onTap: () async {
                        MediaOverlays.presentPlayListPlayerAsOverlay(
                          context: context,
                          playList: playLists[item],
                        );
                      },
                      child: PlaylistTile(
                        isInEditMode: false,
                        playList: playLists[item],
                        onTap: (item) => PlaylistModule.toContextMenu(
                          playList: item,
                          callback: () {
                            fetchPlayLists();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : Container(
            alignment: Alignment.center,
            child: Text(
              noPlaylists,
              style: normal16White,
            ),
          );
  }
}

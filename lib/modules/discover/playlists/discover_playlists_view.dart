import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/discover/playlists/discover_playlists_controller.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/playlist/widgets/playlist_tile.dart';
import 'package:highvibe/values/themes.dart';

class DiscoverPlaylistsView extends StatefulWidget {
  const DiscoverPlaylistsView();

  @override
  _DiscoverPlaylistsViewState createState() => _DiscoverPlaylistsViewState();
}

class _DiscoverPlaylistsViewState
    extends ModularState<DiscoverPlaylistsView, DiscoverPlaylistsController> {
  List<PlayList> _playLists = [];
  String noPlaylists = '';
  @override
  void initState() {
    fetchPlayLists();
    super.initState();
  }

  void fetchPlayLists() async {
    _playLists = await controller.fetchPublicPlaylists();
    setState(() {
      noPlaylists = 'No public playlists available';
    });
  }

  @override
  Widget build(BuildContext context) {
    return _playLists.isEmpty
        ? Container(
            alignment: Alignment.center,
            child: Text(noPlaylists, style: normal16White),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    itemCount: _playLists.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          MediaOverlays.presentPlayListPlayerAsOverlay(
                            context: context,
                            playList: _playLists[index],
                          );
                        },
                        child: PlaylistTile(
                          isInEditMode: false,
                          playList: _playLists[index],
                          onTap: (item) =>
                              PlaylistModule.toContextMenu(playList: item),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}

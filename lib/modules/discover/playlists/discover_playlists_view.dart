import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/discover/playlists/discover_playlists_controller.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/playlist/widgets/playlist_tile.dart';
import 'package:highvibe/utils/utils.dart';
import 'package:highvibe/values/themes.dart';
import 'package:shimmer/shimmer.dart';

class DiscoverPlaylistsView extends StatefulWidget {
  const DiscoverPlaylistsView();

  @override
  _DiscoverPlaylistsViewState createState() => _DiscoverPlaylistsViewState();
}

class _DiscoverPlaylistsViewState
    extends ModularState<DiscoverPlaylistsView, DiscoverPlaylistsController> {
  List<PlayList> _playLists = [];
  String noPlaylists = '';
  bool isPlaylistsFetched = false;
  @override
  void initState() {
    fetchPlayLists();
    super.initState();
  }

  void fetchPlayLists() async {
    _playLists = await controller.fetchPublicPlaylists();
    setState(() {
      noPlaylists = 'No public playlists available';
      isPlaylistsFetched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isPlaylistsFetched) {
      return _shimmers();
    }

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

  Widget _shimmers() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 24),
            child: Shimmer.fromColors(
              baseColor: Colors.white12,
              highlightColor: Colors.white38,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: const EdgeInsets.only(right: 16),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          height: 20,
                          width: screenWidth(context) * 0.8,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          height: 20,
                          width: screenWidth(context) * 0.4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: 8,
      ),
    );
  }
}

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart'
    show Audio, PlayList, tempInMemoryPlaylistCollection;
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_controller.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart'
    show PlaylistModalAlert, PlaylistTile;
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';

class AddToPlaylistPage extends StatefulWidget {
  final Audio audioFile;

  const AddToPlaylistPage({
    @required this.audioFile,
    Key key,
  }) : super(key: key);

  @override
  _AddToPlaylistPageState createState() => _AddToPlaylistPageState();
}

class _AddToPlaylistPageState
    extends ModularState<AddToPlaylistPage, AddToPlaylistController> {
  final SearchBarController<PlayList> _searchBarController =
      SearchBarController();

  final Set<PlayList> _listOfPlaylistToAddAudio = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          PlaylistStrings.addToPlaylist,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const HeaderRow(title: PlaylistStrings.playlist),
                          GestureDetector(
                            onTap: () => PlaylistModule.toCreateNewPlaylist(),
                            child: SizedBox(
                              height: 20,
                              width: 120,
                              child: PlaylistImageAssets.newPlaylist,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: SearchBar(
                      icon: const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Icon(
                          Icons.search,
                          color: Color(0xFF8E8F99),
                        ),
                      ),
                      hintText: PlaylistStrings.search,
                      hintStyle: const TextStyle(
                        color: Color(0xFF8E8F99),
                        fontSize: 18,
                      ),
                      iconActiveColor: Colors.white,
                      textStyle: const TextStyle(color: Colors.white),
                      cancellationWidget: const Text(
                        PlaylistStrings.cancel,
                        style: TextStyle(color: Colors.white),
                      ),
                      searchBarController: _searchBarController,
                      suggestions: tempInMemoryPlaylistCollection.toList(),
                      onItemFound: (item, index) {
                        return PlaylistTile(
                          playList: item,
                          isInEditMode: true,
                          onTap: (selectedPlaylist) =>
                              _configire(selectedPlaylist),
                        );
                      },
                      onSearch: _findPlaylists,
                      emptyWidget: const Text(
                        PlaylistStrings.noMatches,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 2,
                    child: GradientRaisedButton(
                      label: PlaylistStrings.save,
                      onPressed: () => _showSuccessDialog(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // FIXME: - Find a better name
  void _configire(PlayList playlist) {
    if (_listOfPlaylistToAddAudio.contains(playlist)) {
      _listOfPlaylistToAddAudio.remove(playlist);
    } else {
      _listOfPlaylistToAddAudio.add(playlist);
    }
  }

  void _addAudioFileToPlaylist(PlayList playlist) {
    final updatedPlaylist = PlayList(
      (b) => b
        ..coverUrlPath = playlist.coverUrlPath
        ..desscription = playlist.desscription
        ..title = playlist.title
        ..privacy = playlist.privacy
        ..audioFiles.addAll(playlist.audioFiles)
        ..audioFiles.add(widget.audioFile),
    );

    tempInMemoryPlaylistCollection.remove(playlist);
    tempInMemoryPlaylistCollection.add(updatedPlaylist);
  }

  void _showSuccessDialog() {
    for (final item in _listOfPlaylistToAddAudio) {
      _addAudioFileToPlaylist(item);
    }

    showDialog(
      context: context,
      builder: (_) => const PlaylistModalAlert(
        title: PlaylistStrings.audioAddedSuccessTitle,
        subTitle: PlaylistStrings.audioAddedSuccessSubTitle,
      ),
    );
  }

  Future<List<PlayList>> _findPlaylists(String searchTerm) async {
    return tempInMemoryPlaylistCollection
        .where(
          (element) => element.title.startsWith(searchTerm),
        )
        .toList();
  }
}

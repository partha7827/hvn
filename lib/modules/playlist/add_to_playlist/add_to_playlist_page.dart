import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show PlayList;
import 'package:highvibe/modules/app/app_module.dart';
import 'package:highvibe/modules/app/media_overlays.dart';
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_controller.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/playlist/widgets/ui_utils.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart'
    show PlaylistTile, showSuccessDialog;
import 'package:highvibe/widgets/gradient_raised_button.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/responsive_safe_area.dart';

class AddToPlaylistPage extends StatefulWidget {
  final bool isPresentedAsOverlay;

  const AddToPlaylistPage({
    @required this.isPresentedAsOverlay,
    Key key,
  }) : super(key: key);

  @override
  _AddToPlaylistPageState createState() => _AddToPlaylistPageState();
}

class _AddToPlaylistPageState
    extends ModularState<AddToPlaylistPage, AddToPlaylistController> {
  final SearchBarController<PlayList> _searchBarController =
      SearchBarController();

  List<PlayList> playLists = [];
  @override
  void initState() {
    fetchPlayLists();
    super.initState();
  }

  void fetchPlayLists() async {
    playLists = await controller.fetchPlaylists();
    setState(() {});
  }

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
          onPressed: _close,
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
                            onTap: () => _presentCreateNewPlaylist(context),
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
                      suggestions: playLists,
                      onItemFound: (item, index) {
                        return PlaylistTile(
                          playList: item,
                          isInEditMode: true,
                          onTap: (selectedPlaylist) =>
                              controller.populatePlaylistItems(
                            playlist: selectedPlaylist,
                          ),
                        );
                      },
                      onSearch: (searchTerm) => controller.findPlaylists(
                        items: playLists,
                        searchTerm: searchTerm,
                      ),
                      emptyWidget: const Text(
                        PlaylistStrings.noMatches,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: widget.isPresentedAsOverlay ? 8 : 120,
                    child: GradientRaisedButton(
                      label: PlaylistStrings.save,
                      onPressed: () async =>
                          _updatePlaylistAndShowSuccessDialog(context: context),
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

  void _close() {
    if (widget.isPresentedAsOverlay) {
      MediaOverlays.disposeAddToPlaylistOverlayEntry();
      setState(() => AppModule.audioPlayerPageIsOffstage = false);
    } else {
      Modular.to.maybePop();
    }
  }

  void _presentCreateNewPlaylist(BuildContext contex) {
    if (widget.isPresentedAsOverlay) {
      MediaOverlays.presentCreateNewPlaylistAsOverlay(
          context: context,
          callback: () {
            fetchPlayLists();
          });
    } else {
      PlaylistModule.toCreateNewPlaylist(callback: () {
        fetchPlayLists();
      });
    }
  }

  Future<void> _updatePlaylistAndShowSuccessDialog({
    @required BuildContext context,
  }) async {
    showProgressDialog(
      context,
      barrierDismissable: true,
    );
    await controller.saveAudioToPlaylists();
    showSuccessDialog(
      context: context,
      isPresentedAsOverlay: widget.isPresentedAsOverlay,
      title: PlaylistStrings.audioAddedSuccessTitle,
      subTitle: PlaylistStrings.audioAddedSuccessSubTitle,
    );
  }
}

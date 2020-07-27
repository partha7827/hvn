import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart' show PlayList;
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/playlist/playlist_more_menu/playlist_more_menu_controller.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/widgets.dart';

class PlaylistMoreMenuPage extends StatefulWidget {
  final PlayList playlist;
  final Function callback;

  PlaylistMoreMenuPage({
    @required this.playlist,
    this.callback,
    Key key,
  }) : super(key: key);

  @override
  _PlaylistMoreMenuPageState createState() => _PlaylistMoreMenuPageState();
}

class _PlaylistMoreMenuPageState
    extends ModularState<PlaylistMoreMenuPage, PlaylistMoreMenuController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 340,
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeaderRow(title: PlaylistStrings.options),
                IconButton(
                  icon: PlaylistImageAssets.closeBottomSheet,
                  onPressed: () => Modular.to.pop(),
                )
              ],
            ),
            PlaylistMoreItemTile(
              image: PlaylistImageAssets.editBottomSheet,
              title: PlaylistStrings.edit,
              onTap: () {
                Modular.to.pop();
                PlaylistModule.toEditPlaylist(playList: widget.playlist);
              },
            ),
            PlaylistMoreItemTile(
              image: PlaylistImageAssets.addToPlaylistBottonSheet,
              title: PlaylistStrings.addToPlaylist,
              onTap: () => Modular.to.pop(),
            ),
            PlaylistMoreItemTile(
              image: PlaylistImageAssets.addWaypointBottomSheet,
              title: PlaylistStrings.addToWayPoints,
              onTap: () => Modular.to.pop(),
            ),
            PlaylistMoreItemTile(
              image: PlaylistImageAssets.deleteBottomSheet,
              title: PlaylistStrings.delete,
              onTap: () {
                PlatformAlertDialog(
                  title: 'Do you want to delete the playlist?',
                  content: widget.playlist.title,
                  defaultActionText: 'Yes',
                  defaultOnPressed: () async {
                    await controller.deletePlaylistCover(
                      playlist: widget.playlist,
                    );
                    if (widget.callback != null) {
                      widget.callback();
                    }
                    Modular.to.pop();
                    Modular.to.pop();
                  },
                  cancelActionText: 'Cancel',
                ).show(context);
              },
            ),
            PlaylistMoreItemTile(
              image: PlaylistImageAssets.shareBottomSheet,
              title: PlaylistStrings.share,
              onTap: () => Modular.to.pop(),
            ),
          ],
        ),
      ),
    );
  }
}

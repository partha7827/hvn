import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/modules/playlist/widgets/widgets.dart';
import 'package:highvibe/widgets/header_row.dart';
import 'package:highvibe/widgets/widgets.dart';

final _firestorePlaylistService = Modular.get<FirestorePlaylistService>();

Future<void> _deletePlaylistCover({
  @required PlayList playlist,
  @required BuildContext context,
}) async {
  try {
    await _firestorePlaylistService.deletePlaylist(playlist: playlist);
    Modular.to.pop();
    Modular.to.pop();
  } catch (e) {
    Modular.to.pop();
    await PlatformExceptionAlertDialog(
      title: 'Operation failed',
      exception: e,
      context: context,
    ).show(context);
  }
}

void playlistContextMenu(BuildContext context, PlayList playlist) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: Container(
            color: const Color(0xFF212140),
            height: 340,
            child: _buildBottomNavigationMenu(playlist, context),
          ),
        ),
      );
    },
    backgroundColor: Colors.transparent,
  );
}

Widget _buildBottomNavigationMenu(PlayList playlist, BuildContext context) {
  return Container(
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
            PlaylistModule.toEditPlaylist(playList: playlist);
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
              content: playlist.title,
              defaultActionText: 'Yes',
              defaultOnPressed: () => _deletePlaylistCover(
                context: context,
                playlist: playlist,
              ),
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
  );
}

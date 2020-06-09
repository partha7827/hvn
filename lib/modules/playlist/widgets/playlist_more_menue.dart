import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/playlist/playlist_module.dart';
import 'package:highvibe/modules/playlist/resources/resources.dart';
import 'package:highvibe/widgets/header_row.dart';

void playlistContextMenue(BuildContext context, PlayList playlist) {
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
            child: _buildBottomNavigationMenu(playlist),
          ),
        ),
      );
    },
    backgroundColor: Colors.transparent,
  );
}

Widget _buildBottomNavigationMenu(PlayList playlist) {
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
        ListTile(
          leading: PlaylistImageAssets.editBottonSheet,
          title: const Text(
            PlaylistStrings.edit,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          onTap: () => PlaylistModule.toEditPlaylist(),
        ),
        ListTile(
          leading: PlaylistImageAssets.addToPlaylistBottonSheet,
          title: const Text(
            PlaylistStrings.addToPlaylist,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          onTap: () => Modular.to.pop(),
        ),
        ListTile(
          leading: PlaylistImageAssets.addWaypointBottomSheet,
          title: const Text(
            PlaylistStrings.addToWayPoints,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          onTap: () => Modular.to.pop(),
        ),
        ListTile(
          leading: PlaylistImageAssets.deleteBottomSheet,
          title: const Text(
            PlaylistStrings.delete,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          onTap: () => Modular.to.pop(),
        ),
        ListTile(
          leading: PlaylistImageAssets.shareBottomSheet,
          title: const Text(
            PlaylistStrings.share,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          onTap: () => Modular.to.pop(),
        ),
      ],
    ),
  );
}

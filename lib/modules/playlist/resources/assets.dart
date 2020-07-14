import 'package:flutter/material.dart';

class PlaylistImageAssets {
  static final String defaultCover =
      'https://images.unsplash.com/photo-1593455071238-92dd081a39b1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80';

  static final Image newPlaylist = const Image(
    image: AssetImage('assets/icons/new_playlist.png'),
  );

  static final Image radioButtonActive = const Image(
    image: AssetImage('assets/icons/radio_button_filled.png'),
  );

  static final Image radioButtonNotActive = const Image(
    image: AssetImage('assets/icons/radio_button_not_filled.png'),
  );

  static final Image selectImage = const Image(
    image: AssetImage('assets/icons/select_image.png'),
  );

  static final Image closePlaylistAudioTile = const Image(
    image: AssetImage('assets/icons/close_playlist_audio_tile.png'),
  );

  static final Image deletePlaylistCover = const Image(
    image: AssetImage('assets/icons/delete_playlist_cover.png'),
  );

  static final Image checkMarkRounded = const Image(
    image: AssetImage('assets/icons/check_mark_rounded.png'),
  );

  static final Image more = const Image(
    image: AssetImage('assets/icons/playlist_more.png'),
  );

  static final Image addToPlaylistBottonSheet = const Image(
    image: AssetImage('assets/icons/add_to_playlist_bottom_sheet.png'),
  );

  static final Image addWaypointBottomSheet = const Image(
    image: AssetImage('assets/icons/add_waypoint_bottom_sheet.png'),
  );

  static final Image closeBottomSheet = const Image(
    image: AssetImage('assets/icons/close_botton_sheet.png'),
  );

  static final Image deleteBottomSheet = const Image(
    image: AssetImage('assets/icons/delete_bottom_sheet.png'),
  );

  static final Image editBottomSheet = const Image(
    image: AssetImage('assets/icons/edit_botton_sheet.png'),
  );

  static final Image shareBottomSheet = const Image(
    image: AssetImage('assets/icons/share_bottom_sheet.png'),
  );

  static final Image reorderAudioItemInPlaylist = const Image(
    image: AssetImage('assets/icons/reorder_playlist.png'),
  );
}

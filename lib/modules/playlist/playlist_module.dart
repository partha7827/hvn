import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_controller.dart';
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_page.dart';
import 'package:highvibe/modules/playlist/create_new_playlist/create_new_playlist_controller.dart';
import 'package:highvibe/modules/playlist/create_new_playlist/create_new_playlist_page.dart';
import 'package:highvibe/modules/playlist/edit_playlist/edit_playlist_page.dart';
import 'package:highvibe/modules/playlist/edit_playlist/edit_playlist_page_controller.dart';
import 'package:highvibe/modules/playlist/playlist_controller.dart';
import 'package:highvibe/modules/playlist/show_playlists/show_playlists_module.dart';

class PlaylistModule extends ChildModule {
  static final _playlistRoute = '/playlist';

  @override
  List<Bind<Object>> get binds => [
        Bind<PlaylistController>((_) => PlaylistController()),
        Bind<AddToPlaylistController>((_) => AddToPlaylistController()),
        Bind<CreateNewPlaylistController>((_) => CreateNewPlaylistController()),
        Bind<EditPlaylistController>((_) => EditPlaylistController()),
      ];

  @override
  List<Router<Object>> get routers => [
        Router(
          '$_playlistRoute/show_playlists',
          child: (_, args) => ShowPlaylistsModule(args.data),
          transition: TransitionType.fadeIn,
        ),
        Router(
          '$_playlistRoute/add_to_playlist',
          child: (_, args) => AddToPlaylistPage(
            audioFile: args.data,
            isPresentedAsOverlay: false,
          ),
          transition: TransitionType.fadeIn,
        ),
        Router(
          '$_playlistRoute/create_new_playlist',
          child: (_, args) => CreateNewPlaylistPage(
            isPresentedAsOverlay: false,
          ),
          transition: TransitionType.rightToLeft,
        ),
        Router(
          '$_playlistRoute/edit_playlist',
          child: (_, args) => EditPlaylistPage(playlist: args.data),
          transition: TransitionType.rightToLeft,
        ),
      ];

  static Future<Object> toAddToPlaylist({@required Audio audioFile}) =>
      Modular.to
          .pushNamed('$_playlistRoute/add_to_playlist', arguments: audioFile);

  static Future<Object> toCreateNewPlaylist() =>
      Modular.to.pushNamed('$_playlistRoute/create_new_playlist');

  static Future<Object> toEditPlaylist({@required PlayList playList}) =>
      Modular.to
          .pushNamed('$_playlistRoute/edit_playlist', arguments: playList);

  static Future<Object> toOpenPlaylist({@required PlayList playList}) =>
      Modular.to
          .pushNamed('$_playlistRoute/open_playlist', arguments: playList);

}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_controller.dart';
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_page.dart';
import 'package:highvibe/modules/playlist/api/firestore_playlist_service.dart';
import 'package:highvibe/modules/playlist/create_new_playlist/create_new_playlist_controller.dart';
import 'package:highvibe/modules/playlist/create_new_playlist/create_new_playlist_page.dart';
import 'package:highvibe/modules/playlist/edit_playlist/edit_playlist_page.dart';
import 'package:highvibe/modules/playlist/edit_playlist/edit_playlist_page_controller.dart';
import 'package:highvibe/modules/playlist/playlist_controller.dart';
import 'package:highvibe/modules/playlist/playlist_more_menu/playlist_more_menu_controller.dart';
import 'package:highvibe/modules/playlist/playlist_more_menu/playlist_more_menu_page.dart';
import 'package:highvibe/modules/playlist/show_playlists/show_playlists_controller.dart';
import 'package:highvibe/modules/playlist/show_playlists/show_playlists_module.dart';
import 'package:highvibe/services/storage_service.dart';

class PlaylistModule extends ChildModule {
  static final _playlistRoute = '/playlist';
  final _currentUserStore = Modular.get<AppController>();

  @override
  List<Bind<Object>> get binds => [
        Bind<FirestorePlaylistService>(
          (_) => FirestorePlaylistService(
            userId: _currentUserStore.currentUser.id,
          ),
        ),
        Bind<StorageService>((_) => StorageService.withFirebase()),
        Bind<PlaylistController>((_) => PlaylistController()),
        Bind<AddToPlaylistController>(
          (i) => AddToPlaylistController(i.args.data),
        ),
        Bind<CreateNewPlaylistController>((_) => CreateNewPlaylistController()),
        Bind<EditPlaylistController>((_) => EditPlaylistController()),
        Bind<ShowPlaylistsController>((_) => ShowPlaylistsController()),
        Bind<PlaylistMoreMenuController>((_) => PlaylistMoreMenuController()),
      ];

  @override
  List<Router<Object>> get routers => [
        Router(
          '$_playlistRoute/context_menu',
          child: (_, args) => PlaylistMoreMenuPage(playlist: args.data),
          transition: TransitionType.downToUp,
        ),
        Router(
          '$_playlistRoute/show_playlists',
          child: (_, args) => ShowPlaylistsModule(userId: args.data),
          transition: TransitionType.fadeIn,
        ),
        Router(
          '$_playlistRoute/add_to_playlist',
          child: (_, args) => const AddToPlaylistPage(
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

  static Future<Object> toShowPlaylists() =>
      Modular.to.pushNamed('$_playlistRoute/show_playlists');

  static Future<Object> toContextMenu({@required PlayList playList}) =>
      Modular.to.pushNamed('$_playlistRoute/context_menu', arguments: playList);
}

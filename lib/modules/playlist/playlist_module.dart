import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_controller.dart';
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_page.dart';
import 'package:highvibe/modules/playlist/create_new_playlist/create_new_playlist_controller.dart';
import 'package:highvibe/modules/playlist/create_new_playlist/create_new_playlist_page.dart';
import 'package:highvibe/modules/playlist/edit_playlist/edit_playlist_page.dart';
import 'package:highvibe/modules/playlist/edit_playlist/edit_playlist_page_controller.dart';
import 'package:highvibe/modules/playlist/playlist_controller.dart';

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
          '$_playlistRoute/add_to_playlist',
          child: (_, args) => AddToPlaylistPage(),
          transition: TransitionType.fadeIn,
        ),
        Router(
          '$_playlistRoute/create_new_playlist',
          child: (_, args) => CreateNewPlaylistPage(),
          transition: TransitionType.rightToLeft,
        ),
        Router(
          '$_playlistRoute/edit_playlist',
          child: (_, args) => EditPlaylistPage(),
          transition: TransitionType.rightToLeft,
        ),
      ];

  static Future<Object> toAddToPlaylist() =>
      Modular.to.pushNamed('$_playlistRoute/add_to_playlist');

  static Future<Object> toCreateNewPlaylist() =>
      Modular.to.pushNamed('$_playlistRoute/create_new_playlist');

  static Future<Object> toEditPlaylist() =>
      Modular.to.pushNamed('$_playlistRoute/edit_playlist');
}

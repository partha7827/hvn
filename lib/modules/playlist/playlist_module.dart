import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/playlist_controller.dart';
import 'package:highvibe/modules/playlist/playlist_page.dart';

class PlaylistModule extends ChildModule {
  static final _playlistRoute = '/playlist';

  @override
  List<Bind<Object>> get binds => [
        Bind<PlaylistController>((_) => PlaylistController()),
      ];

  @override
  List<Router<Object>> get routers => [
        Router(
          _playlistRoute,
          child: (_, args) => PlaylistPage(),
          transition: TransitionType.downToUp,
        ),
      ];

  static Future<Object> toAddToPlaylist() =>
      Modular.to.pushNamed(_playlistRoute);

  static Future<Object> toCreateNewPlaylist() =>
      Modular.to.pushNamed('$_playlistRoute/create_new_playlist');

  static Future<Object> toEditPlaylist() =>
      Modular.to.pushNamed('$_playlistRoute/edit_playlist');
}

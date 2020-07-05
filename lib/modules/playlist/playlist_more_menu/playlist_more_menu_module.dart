import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/playlist/playlist_more_menu/playlist_more_menu_controller.dart';
import 'package:highvibe/modules/playlist/playlist_more_menu/playlist_more_menu_page.dart';

class PlaylistMoreMenuModule extends WidgetModule {
  final PlayList playlist;

  PlaylistMoreMenuModule({@required this.playlist});

  @override
  List<Bind<Object>> get binds => [
        Bind<PlaylistMoreMenuController>((_) => PlaylistMoreMenuController()),
      ];

  @override
  Widget get view => PlaylistMoreMenuPage(playlist: playlist);

  void playlistContextMenu(BuildContext context, PlayList playlist) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
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
              child: view,
            ),
          ),
        );
      },
      backgroundColor: Colors.transparent,
    );
  }
}

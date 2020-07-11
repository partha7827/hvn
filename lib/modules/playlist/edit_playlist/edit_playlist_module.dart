import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/playlist/playlist.dart';
import 'package:highvibe/modules/playlist/edit_playlist/edit_playlist_page.dart';
import 'package:highvibe/modules/playlist/edit_playlist/edit_playlist_page_controller.dart';

class EditPlaylistModule extends WidgetModule {
  final PlayList playList;

  EditPlaylistModule({@required this.playList});

  @override
  List<Bind<Object>> get binds => [
        Bind<EditPlaylistController>((i) => EditPlaylistController(playList)),
      ];

  @override
  Widget get view => EditPlaylistPage();
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/playlist/open_playlist/open_playlist.dart';
import 'package:highvibe/modules/playlist/open_playlist/open_playlist_controller.dart';
import 'package:highvibe/services/audio_player_service.dart';

class OpenPlayListModule extends WidgetModule {
  final PlayList playList;

  OpenPlayListModule({@required this.playList});

  @override
  List<Bind<Object>> get binds => [
        Bind<AudioPlayerService>((i) => AudioPlayerService.withPlayer()),
        Bind<OpenPlaylistController>((i) => OpenPlaylistController(playList)),
      ];

  @override
  Widget get view => OpenPlaylistPage(playList: playList,);
}

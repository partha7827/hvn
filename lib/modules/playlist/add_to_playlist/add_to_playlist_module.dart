import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_controller.dart';
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_page.dart';

class AddToPlaylistModule extends WidgetModule {
  final Audio audioFile;
  AddToPlaylistModule({@required this.audioFile});

  @override
  List<Bind<Object>> get binds => [
        Bind<AddToPlaylistController>((i) => AddToPlaylistController()),
      ];

  @override
  Widget get view => AddToPlaylistPage(audioFile: audioFile);
}

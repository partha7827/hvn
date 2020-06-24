import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/create_new_playlist/create_new_playlist_controller.dart';
import 'package:highvibe/modules/playlist/create_new_playlist/create_new_playlist_page.dart';

class CreateNewPlaylistModule extends WidgetModule {
  final bool isPresentedAsOverlay;

  CreateNewPlaylistModule({@required this.isPresentedAsOverlay});

  @override
  List<Bind<Object>> get binds => [
        Bind<CreateNewPlaylistController>((i) => CreateNewPlaylistController()),
      ];

  @override
  Widget get view {
    return CreateNewPlaylistPage(isPresentedAsOverlay: isPresentedAsOverlay);
  }
}

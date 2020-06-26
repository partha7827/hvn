import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'show_playlists_controller.dart';
import 'show_playlists_page.dart';

class ShowPlaylistsModule extends WidgetModule {
  final String userId;
  ShowPlaylistsModule(this.userId);

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => ShowPlaylistsController(userId)),
      ];

  @override
  Widget get view => const ShowPlaylistsPage();
}

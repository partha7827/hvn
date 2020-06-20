import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'open_playlist_controller.dart';
import 'open_playlist_page.dart';

class OpenPlaylistModule extends WidgetModule {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => OpenPlaylistController()),
      ];

  @override
  Widget get view => const OpenPlaylistPage();
}
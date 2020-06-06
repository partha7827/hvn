import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/playlist/playlist_page.dart';

class PlaylistModule extends WidgetModule {
  @override
  List<Bind<Object>> get binds => [];

  @override
  Widget get view => PlaylistPage();
}

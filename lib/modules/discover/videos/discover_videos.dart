import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/discover/videos/discover_videos_controller.dart';
import 'package:highvibe/modules/discover/videos/discover_videos_view.dart';

class DiscoverVideos extends WidgetModule {
  @override
  final List<Bind<Object>> binds = [
    Bind((i) => DiscoverVideosController()),
  ];

  @override
  Widget get view => DiscoverVideosView();
}

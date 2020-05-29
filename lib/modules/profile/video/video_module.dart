import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/modules/profile/video/video_controller.dart';
import 'package:hvn/modules/profile/video/video_page.dart';

class VideoModule extends WidgetModule {
  final String userId;

  VideoModule(this.userId);

  @override
  List<Bind> get binds => [
        Bind((i) => VideoController(userId)),
      ];

  @override
  Widget get view => VideoPage();
}

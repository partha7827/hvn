import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/modules/profile/audio/audio_controller.dart';
import 'package:hvn/modules/profile/audio/audio_page.dart';

class AudioModule extends WidgetModule {
  final String userId;

  AudioModule(this.userId);

  @override
  List<Bind> get binds => [
        Bind((i) => AudioController(userId)),
      ];

  @override
  Widget get view => AudioPage();
}

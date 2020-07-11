import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/profile/audio/audio_controller.dart';
import 'package:highvibe/modules/profile/audio/audio_page.dart';

class AudioModule extends WidgetModule {
  final String userId;

  AudioModule(this.userId);

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => AudioController(userId)),
      ];

  @override
  Widget get view => AudioPage();
}
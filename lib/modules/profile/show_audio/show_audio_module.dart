import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/profile/show_audio/show_audio_controller.dart';
import 'package:highvibe/modules/profile/show_audio/show_audio_page.dart';

class ShowAudioModule extends WidgetModule {
  final String userId;

  ShowAudioModule(this.userId);

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => ShowAudioController(userId)),
      ];

  @override
  Widget get view => ShowAudioPage();
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/modules/audio_player/audio_player_controller.dart';
import 'package:highvibe/modules/audio_player/audio_player_page.dart';
import 'package:highvibe/services/audio_player_service.dart';

class AudioPlayerModule extends WidgetModule {
  final Audio audioFile;
  AudioPlayerModule(this.audioFile);

  @override
  List<Bind<Object>> get binds => [
        Bind<AudioPlayerService>((i) => AudioPlayerService.withPlayer()),
        Bind<AudioPlayerController>((i) => AudioPlayerController(audioFile)),
      ];

  @override
  Widget get view => AudioPlayerPage();
}

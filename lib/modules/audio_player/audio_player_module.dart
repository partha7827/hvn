import 'package:flutter/material.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/modules/audio_player/audio_player_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/audio_player/audio_player_page.dart';
import 'package:highvibe/modules/audio_player/audio_player_service.dart';

class AudioPlayerModule extends WidgetModule {
  final Audio audioFile;
  AudioPlayerModule(this.audioFile);

  @override
  List<Bind> get binds => [
        Bind((i) => AudioPlayerController(audioFile)),
        Bind((i) => AudioPlayerService(audioFile: audioFile)),
      ];

  Widget get view => AudioPlayerPage();
}

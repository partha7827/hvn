import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/mocks/mock_audio_files.dart';
import 'package:highvibe/models/audio/audio.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/audio_player/audio_player_module.dart';
import 'package:highvibe/modules/playlist/open_playlist/open_playlist_module.dart';
import 'package:mobx/mobx.dart';

mixin MediaOverlaysMixin {
  @observable
  OverlayEntry overlay;

  BuildContext overlayContext;

  @action
  void toAudioPlayer({BuildContext context, Audio audioFile}) {
    overlay = OverlayEntry(
      builder: (_) => AudioPlayerModule(audioFile: audioFile),
    );
    overlayContext = context;
  }

  @action
  void toPlaylist() {
    overlay = OverlayEntry(
      builder: (_) => OpenPlayListModule(
        playList: mockPlaylist,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart' show Audio, Video;
import 'package:highvibe/modules/audio_player/audio_player_module.dart';
import 'package:highvibe/modules/playlist/add_to_playlist/add_to_playlist_module.dart';
import 'package:highvibe/modules/video_player/video_player_page.dart';

class MediaOverlays {
  static final GlobalKey<AudioPlayerPageState> audioKey = GlobalKey();

  static OverlayState _mediaOverlayState;
  static OverlayEntry _videoOverlayEntry;
  static OverlayEntry _audioOverlayEntry;
  static OverlayEntry _addToPlaylistOverlayEntry;

  MediaOverlays._();

  static void disposeAddToPlaylistOverlayEntry() {
    _addToPlaylistOverlayEntry?.remove();
    _addToPlaylistOverlayEntry = null;
  }

  static void disposeAudioOverlayEntry() {
    _audioOverlayEntry?.remove();
    _audioOverlayEntry = null;
    audioKey?.currentState?.controller?.player?.stop();
  }

  static void disposeVideoOverlayEntry() {
    _videoOverlayEntry?.remove();
    _videoOverlayEntry = null;
  }

  static void presentAddToPlaylistAsOverlay({
    @required BuildContext context,
    @required Audio audioFile,
  }) {
    _mediaOverlayState = Overlay.of(context);

    _addToPlaylistOverlayEntry = OverlayEntry(
      builder: (_) => AddToPlaylistModule(audioFile: audioFile),
    );
    _mediaOverlayState.insert(
      _addToPlaylistOverlayEntry,
      above: _audioOverlayEntry,
    );
  }

  static void presentAudioPlayerAsOverlay({
    @required BuildContext context,
    @required Audio audioFile,
  }) {
    _removeAllOverlays();

    if (audioKey.currentState?.controller?.player != null) {
      audioKey.currentState.controller.player.play(audioFile.audioUrlPath);
      audioKey.currentState.controller.audioFile = audioFile;
    }

    _mediaOverlayState = Overlay.of(context);
    _audioOverlayEntry = OverlayEntry(
      builder: (_) => AudioPlayerModule(audioFile),
    );
    _mediaOverlayState.insert(_audioOverlayEntry);
  }

  static void presentVideoPlayerAsOverlay({
    @required BuildContext context,
    @required Video video,
  }) {
    _mediaOverlayState = Overlay.of(context);
    _removeAllOverlays();
    _videoOverlayEntry = OverlayEntry(
      builder: (_) => VideoPlayerPage(video: video),
    );
    _mediaOverlayState.insert(_videoOverlayEntry);
  }

  static void _removeAllOverlays() {
    disposeAudioOverlayEntry();
    disposeVideoOverlayEntry();
    disposeAddToPlaylistOverlayEntry();
  }
}

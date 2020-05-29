import 'package:flutter/material.dart';
import 'package:hvn/models/models.dart' show Audio, Video;
import 'package:hvn/modules/audio_player/audio_player_page.dart';
import 'package:hvn/modules/video_player/video_player_page.dart';

class MediaOverlays {
  static OverlayState _mediaOverlayState;
  static OverlayEntry _videoOverlayEntry;
  static OverlayEntry _audioOverlayEntry;

  const MediaOverlays._();

  static void disposeAudioOverlayEntry() {
    _audioOverlayEntry?.remove();
    _audioOverlayEntry = null;
  }

  static void disposeVideoOverlayEntry() {
    _videoOverlayEntry?.remove();
    _videoOverlayEntry = null;
  }

  static void _removeAllOverlays() {
    disposeAudioOverlayEntry();
    disposeVideoOverlayEntry();
  }

  static void presentAudioPlayerAsOverlay({
    @required BuildContext context,
    @required Audio audioFile,
  }) {
    _mediaOverlayState = Overlay.of(context);
    _removeAllOverlays();
    _audioOverlayEntry = OverlayEntry(
      builder: (_) => AudioPlayerPage(audioFile: audioFile),
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
}

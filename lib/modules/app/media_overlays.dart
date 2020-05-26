import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart' show Audio, Video;
import 'package:highvibe/modules/audio_player/audio_player_page.dart';
import 'package:highvibe/modules/video_player/video_player_page.dart';

class MediaOverlays {
  static OverlayEntry _videoOverlayEntry;
  static OverlayState _videOverlayState;

  static OverlayEntry _audioOverlayEntry;
  static OverlayState _audioOverlayState;

  const MediaOverlays._();

  static void disposeAudioOverlayEntry() {
    if (MediaOverlays._audioOverlayEntry != null) {
      MediaOverlays._audioOverlayEntry.remove();
    }
  }

  static void disposeVideoOverlayEntry() {
    if (MediaOverlays._videoOverlayEntry != null) {
      MediaOverlays._videoOverlayEntry.remove();
    }
  }

  static void presentAudioPlayerAsOverlay({
    @required BuildContext context,
    @required Audio audioFile,
  }) {
    _audioOverlayState = Overlay.of(context);
    _audioOverlayEntry = OverlayEntry(
      builder: (context) {
        return AudioPlayerPage(audioFile: audioFile);
      },
    );

    _audioOverlayState.insert(_audioOverlayEntry);
  }

  static void presentVideoPlayerAsOverlay({
    @required BuildContext context,
    @required Video video,
  }) {
    _videOverlayState = Overlay.of(context);
    _videoOverlayEntry = OverlayEntry(
      builder: (context) {
        return VideoPlayerPage(video: video);
      },
    );

    _videOverlayState.insert(_videoOverlayEntry);
  }
}

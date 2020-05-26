// Global properties
import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart' show Audio, Video;
import 'package:highvibe/modules/audio_player/audio_player_page.dart';
import 'package:highvibe/modules/video_player/video_player_page.dart';

class MediaOverlays {
  static OverlayEntry videoOverlayEntry;
  static OverlayState videOverlayState;

  static OverlayEntry audioOverlayEntry;
  static OverlayState audioOverlayState;

  MediaOverlays._();

  static void presentAudioPlayerAsOverlay({
    @required BuildContext context,
    @required Audio audioFile,
  }) {
    audioOverlayState = Overlay.of(context);
    audioOverlayEntry = OverlayEntry(
      builder: (context) {
        return AudioPlayerPage(audioFile: audioFile);
      },
    );

    audioOverlayState.insert(audioOverlayEntry);
  }

  static void presentVideoPlayerAsOverlay({
    @required BuildContext context,
    @required Video video,
  }) {
    videOverlayState = Overlay.of(context);
    videoOverlayEntry = OverlayEntry(
      builder: (context) {
        return VideoPlayerPage(video: video);
      },
    );

    videOverlayState.insert(videoOverlayEntry);
  }
}

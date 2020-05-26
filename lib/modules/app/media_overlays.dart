// Global properties
import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart' show Audio, Video;
import 'package:highvibe/modules/audio_player/audio_player_page.dart';
import 'package:highvibe/modules/video_player/video_player_page.dart';

OverlayEntry videoOverlayEntry;
OverlayState videOverlayState;

OverlayEntry audioOverlayEntry;
OverlayState audioOverlayState;

void presentVideoPlayerAsOverlay(BuildContext context, Video video) {
  videOverlayState = Overlay.of(context);
  videoOverlayEntry = OverlayEntry(
    builder: (context) {
      return VideoPlayerPage(video: video);
    },
  );

  videOverlayState.insert(videoOverlayEntry);
}

void presentAudioPlayerAsOverlay(BuildContext context, Audio audioFile) {
  audioOverlayState = Overlay.of(context);
  audioOverlayEntry = OverlayEntry(
    builder: (context) {
      return AudioPlayerPage(audioFile: audioFile);
    },
  );

  audioOverlayState.insert(audioOverlayEntry);
}

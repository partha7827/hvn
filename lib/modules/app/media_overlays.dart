// Global properties
import 'package:flutter/material.dart';
import 'package:highvibe/models/models.dart' show Video;
import 'package:highvibe/modules/video_player/video_player_page.dart';

OverlayEntry videoOverlayEntry;
OverlayState videOverlayState;

void presentVideoPlayerAsOverlay(BuildContext context, Video video) {
  videOverlayState = Overlay.of(context);
  videoOverlayEntry = OverlayEntry(
    builder: (context) {
      return VideoPlayerPage(video: video);
    },
  );

  videOverlayState.insert(videoOverlayEntry);
}

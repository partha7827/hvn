import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayPauseOverlay extends StatelessWidget {
  final VideoPlayerController controller;

  const PlayPauseOverlay({
    @required this.controller,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                ),
        ),
        GestureDetector(onTap: () => _toggle()),
      ],
    );
  }

  void _toggle() {
    controller.value.isPlaying ? controller.pause() : controller.play();
  }
}

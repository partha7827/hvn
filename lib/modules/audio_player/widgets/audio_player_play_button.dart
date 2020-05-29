import 'package:flutter/material.dart';

class AudioPlayerPlayButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final Animation progress;

  AudioPlayerPlayButton({
    @required this.onPressed,
    @required this.progress,
    this.color = Colors.black,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        color: color,
        progress: progress,
      ),
      onPressed: onPressed,
    );
  }
}

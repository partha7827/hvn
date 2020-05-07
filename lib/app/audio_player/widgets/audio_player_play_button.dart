import 'package:flutter/material.dart';

class AudioPlayerPlayButton<S> extends StatelessWidget {
  final Color activeColor;
  final Color disabledColor;
  final Stream<S> stream;
  final VoidCallback onPressed;

  AudioPlayerPlayButton({
    Key key,
    @required this.onPressed,
    this.stream,
    this.activeColor = Colors.black,
    this.disabledColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return Container(
          child: IconButton(
            iconSize: 70,
            icon: const Icon(Icons.play_circle_filled),
            color: activeColor,
            disabledColor: disabledColor,
            onPressed: (snapshot.hasData) ? onPressed : null,
          ),
        );
      },
    );
  }
}

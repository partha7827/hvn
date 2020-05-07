import 'package:flutter/material.dart';

class AudioPlayerSkipButton<S> extends StatelessWidget {
  final Color activeColor;
  final Color disabledColor;
  final AudioPlayerSkipButtonType buttonType;
  final Stream<S> stream;
  final VoidCallback onPressed;

  AudioPlayerSkipButton({
    @required this.buttonType,
    @required this.onPressed,
    this.stream,
    this.activeColor = Colors.black,
    this.disabledColor = Colors.grey,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return Container(
          child: IconButton(
            iconSize: 70,
            icon: _configureIcon(),
            color: activeColor,
            disabledColor: disabledColor,
            onPressed: (snapshot.hasData) ? onPressed : null,
          ),
        );
      },
    );
  }

  Icon _configureIcon() {
    if (buttonType == AudioPlayerSkipButtonType.fastForward) {
      return const Icon(Icons.fast_forward);
    } else {
      return const Icon(Icons.fast_rewind);
    }
  }
}

enum AudioPlayerSkipButtonType { fastForward, rewind }

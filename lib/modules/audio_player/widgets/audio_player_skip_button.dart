import 'package:flutter/material.dart';
import 'package:highvibe/services/audio_player_service.dart';

class AudioPlayerSkipButton extends StatelessWidget {
  final Color activeColor;
  final Color disabledColor;
  final AudioPlayerSkipButtonType buttonType;
  final VoidCallback onPressed;

  AudioPlayerSkipButton({
    @required this.buttonType,
    @required this.onPressed,
    this.activeColor = Colors.black,
    this.disabledColor = Colors.grey,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        iconSize: 70,
        icon: _configureIcon(),
        color: activeColor,
        disabledColor: disabledColor,
        onPressed: onPressed,
      ),
    );
  }

  Icon _configureIcon() {
    if (buttonType == AudioPlayerSkipButtonType.fastForward) {
      return Icon(Icons.fast_forward, color: Colors.white, size: 36);
    } else {
      return Icon(Icons.fast_rewind, color: Colors.white, size: 36);
    }
  }
}

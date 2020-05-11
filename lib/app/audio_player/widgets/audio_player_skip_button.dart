import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highvibe/app/audio_player/audio_player_service.dart';

class AudioPlayerSkipButton<S> extends StatelessWidget {
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

  SvgPicture _configureIcon() {
    if (buttonType == AudioPlayerSkipButtonType.fastForward) {
      return SvgPicture.asset('assets/ic_forward.svg');
    } else {
      return SvgPicture.asset('assets/ic_backward.svg');
    }
  }
}

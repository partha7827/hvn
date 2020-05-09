import 'package:flutter/material.dart';

class AudioPlayerPlayButton extends StatelessWidget {
  final Color activeColor;
  final Color disabledColor;
  final Icon icon;
  final VoidCallback onPressed;

  AudioPlayerPlayButton({
    @required this.icon,
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
        icon: icon,
        color: activeColor,
        disabledColor: disabledColor,
        onPressed: onPressed,
      ),
    );
  }
}

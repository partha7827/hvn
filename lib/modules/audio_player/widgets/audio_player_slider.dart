import 'package:flutter/material.dart';

typedef UpdateTrackPosition = double Function();

class AudioPlayerSlider extends StatelessWidget {
  final double trackPosition;
  final ValueChanged<double> onChanged;
  final Color inActiveColor, activeColor;

  const AudioPlayerSlider({
    @required this.trackPosition,
    @required this.onChanged,
    this.activeColor = Colors.black,
    this.inActiveColor,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: trackPosition,
      activeColor: activeColor,
      inactiveColor: inActiveColor,
      onChanged: (value) => onChanged(value),
    );
  }
}

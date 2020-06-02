import 'package:flutter/material.dart';

typedef UpdateTrackPosition = double Function();

class AudioPlayerSlider extends StatelessWidget {
  final double trackPosition;
  final ValueChanged<double> onChanged;

  const AudioPlayerSlider({
    @required this.trackPosition,
    @required this.onChanged,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: trackPosition,
      activeColor: Colors.black,
      onChanged: (value) => onChanged(value),
    );
  }
}

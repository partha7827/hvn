import 'package:flutter/material.dart';

typedef double UpdateTrackPosition();

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
    return Material(
      child: Slider(
        value: trackPosition,
        activeColor: Colors.black,
        onChanged: (value) => onChanged(value),
      ),
    );
  }
}

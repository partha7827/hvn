import 'package:flutter/material.dart';
import 'package:highvibe/app/audio_player/models/models.dart' show AudioFile;

class AudioPlayerSlider extends StatelessWidget {
  final AudioFile audioFile;

  const AudioPlayerSlider({
    @required this.audioFile,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: 0,
      min: 0,
      max: audioFile.duration.toDouble(),
      activeColor: Colors.black,
      onChanged: (value) => print('Seek To!'),
      onChangeEnd: (value) => print('Resume!'),
    );
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart' show required;
import 'package:highvibe/app/audio_player/models/models.dart';

class AudioPlayerService {
  final AudioPlayer audioPlayer;

  AudioPlayerService({AudioPlayer audioPlayer})
      : audioPlayer = audioPlayer ?? AudioPlayer() {
    audioPlayer.onAudioPositionChanged;
  }

  void dispose() => audioPlayer.dispose();

  Stream<Duration> onProgress() => audioPlayer.onAudioPositionChanged;

  void pauseAudio() async => await audioPlayer.pause();

  void playAudio({@required AudioFile audioFile}) async {
    await audioPlayer.play(audioFile.audioFileUrlPath);
  }

  void resumeAudio() async => await audioPlayer.resume();

  void seekTo(Duration position) async => await audioPlayer.seek(position);

  void stopAudio() async => await audioPlayer.stop();
}

import 'package:audioplayers/audioplayers.dart';

class AudioPlayerMock extends AudioPlayer {
  Future<int> play(
    String url, {
    bool isLocal,
    double volume = 1.0,
    Duration position,
    bool respectSilence = false,
    bool stayAwake = false,
  }) =>
      Future.value(1);

  Future<int> pause() => Future.value(1);

  Future<int> resume() => Future.value(1);

  Future<int> stop() => Future.value(1);

  Future<int> seek(Duration position) => Future.value(1);

  Future<int> setReleaseMode(ReleaseMode mode) => Future.value(1);
}

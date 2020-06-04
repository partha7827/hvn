import 'package:flutter_test/flutter_test.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:highvibe/services/audio_player_service.dart';

void main() async {
  final service = AudioPlayerService.withMock();
  
  test('initialize audio player service', () async {
    expect(service.audioPlayer, isInstanceOf<AudioPlayer>());
  });
}
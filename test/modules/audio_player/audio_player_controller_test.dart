import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/modules/audio_player/audio_player_module.dart';
import 'package:highvibe/modules/audio_player/audio_player_controller.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/mocks/mock_audio_files.dart';
import 'package:highvibe/services/audio_player_service.dart';

void main() {
  final audioFile = mockAudioItemsList[0];

  initModule(AudioPlayerModule(audioFile), changeBinds: [
    Bind<AudioPlayerService>((i) => AudioPlayerService.withMock()),
  ]);

  AudioPlayerController controller;

  setUp(() {
    controller = Modular.get<AudioPlayerController>();
  });

  test('controller', () async {
    expect(controller.player, isInstanceOf<AudioPlayerService>());
    expect(controller.audioFile, isInstanceOf<Audio>());
  });
}

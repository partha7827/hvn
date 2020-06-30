import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/services/storage_service.dart';
import 'package:mobx/mobx.dart';
import 'package:highvibe/modules/profile/audio/audio_controller.dart';

import '../../../lib/mocks/mock_audio_files.dart';
import '../../../lib/mocks/mock_database.dart' as database;
import '../../../lib/modules/profile/audio/audio_module.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  initModule(AudioModule(database.mockUser.id), changeBinds: [
    Bind<AuthService>((i) => AuthService.withMock()),
    Bind<FirestoreService>((i) => FirestoreService.withMock()),
    Bind<StorageService>((i) => StorageService.withMock()),
  ]);

  AudioController controller;
  AppController app;

  setUp(() async {
    app = Modular.get<AppController>();
    controller = Modular.get<AudioController>();

    await app.setCurrentUser(mockUser);

  });

  test('controller', () async {
    expect(controller, isInstanceOf<AudioController>());
  });


  test('upload audio', () async {
    final audio = mockAudioItemsList.first;

    controller.uploadAudio(audio);
    expect(controller.uploadStatus, equals(FutureStatus.pending));
  });
}

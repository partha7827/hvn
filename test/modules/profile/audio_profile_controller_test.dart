
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/profile/show_audio/show_audio_controller.dart';
import 'package:highvibe/modules/profile/show_audio/show_audio_module.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/services/storage_service.dart';
import 'package:highvibe/mocks/mock_database.dart' as database;


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  initModule(ShowAudioModule(database.mockUser.id), changeBinds: [
    Bind<AuthService>((i) => AuthService.withMock()),
    Bind<FirestoreService>((i) => FirestoreService.withMock()),
    Bind<StorageService>((i) => StorageService.withMock()),
  ]);

  ShowAudioController controller;
  AppController app;

  setUp(() async {
    app = Modular.get<AppController>();
    controller = Modular.get<ShowAudioController>();

    await app.setCurrentUser(mockUser);

  });

  test('controller', () async {
    expect(controller, isInstanceOf<ShowAudioController>());
  });
}

import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/profile/current_user/edit_profile/edit_profile.dart';
import 'package:highvibe/modules/profile/current_user/edit_profile/edit_profile_controller.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/services/storage_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  initModule(EditProfile(), changeBinds: [
    Bind<AuthService>((i) => AuthService.withMock()),
    Bind<FirestoreService>((i) => FirestoreService.withMock()),
    Bind<StorageService>((i) => StorageService.withMock()),
  ]);

  EditProfileController controller;
  AppController app;

  setUp(() async {
    controller = Modular.get<EditProfileController>();
    app = Modular.get<AppController>();

    await app.setCurrentUser(mockUser);

    controller.init();
  });

  test('controller', () async {
    expect(controller, isInstanceOf<EditProfileController>());
  });

  test('update user', () async {
    expect(controller.nameController.text.toString(), equals(mockUser.name));
    expect(controller.bioController.text.toString(), equals(mockUser.bio));

    controller.nameController.text = 'Updated Name';

    final updatedUser = await controller.updateUserInfo();

    expect(controller.inProgress, equals(false));
    expect(updatedUser.name, equals('Updated Name'));
  });

  test('update avatar', () async {
    final file = File('../../assets/app_icon.png');

    final updatedUser = await controller.updateUserAvatar(file);

    expect(controller.inProgress, equals(false));
    expect(updatedUser.photoUrl, equals('download-url'));
  });
}

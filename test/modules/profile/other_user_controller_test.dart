import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/profile/other_user/other_user_module.dart';

import 'package:highvibe/modules/profile/other_user/other_user_controller.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  initModule(OtherUserModule(mockAnotherUser), changeBinds: [
    Bind<AuthService>((i) => AuthService.withMock()),
    Bind<FirestoreService>((i) => FirestoreService.withMock()),
  ]);

  OtherUserController controller;
  AppController appStore;

  setUp(() {
    controller = Modular.get<OtherUserController>();
    appStore = Modular.get<AppController>();
  });

  test("controller", () async {
    expect(controller, isInstanceOf<OtherUserController>());
    expect(controller.otherUser, equals(mockAnotherUser));
    expect(controller.otherUser.id, equals(mockAnotherUser.id));
  });

  test("follow/unfollow user", () async {
    await appStore.setCurrentUser(mockUser);

    expect(controller.followers.toList(), equals([]));
    expect(controller.following.toList(), equals([]));
    expect(controller.isFollowing, equals(false));

    await controller.followUser();

    expect(controller.followers.toList(), equals([mockUser.id]));
    expect(controller.following.toList(), equals([]));
    expect(controller.isFollowing, equals(true));

    await controller.followUser();

    expect(controller.followers.toList(), equals([]));
    expect(controller.following.toList(), equals([]));
    expect(controller.isFollowing, equals(false));
  });
}

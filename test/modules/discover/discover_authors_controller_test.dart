import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/services/firestore_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // initModule(DiscoverAuthors(), changeBinds: [
  //   Bind<FirestoreService>((i) => FirestoreService.withMock()),
  // ]);

  // DiscoverAuthorsController controller;
  // AppController appStore;

  // setUp(() {
  //   controller = Modular.get<DiscoverAuthorsController>();
  //   appStore = Modular.get<AppController>();
  // });

  // test("controller", () async {
  //   expect(controller, isInstanceOf<DiscoverAuthorsController>());
  // });

  // test("load users", () async {
  //   await controller.loadUsers();

  //   if (controller.users.isNotEmpty)
  //     expect(controller.users.toList(), equals([mockUser, mockAnotherUser]));
  // });

  // test("follow user", () async {
  //   await appStore.setCurrentUser(mockUser);
    
  //   await controller.followUser(mockAnotherUser.id);

  //   expect(controller.isFollowing[mockAnotherUser.id], equals(true));
  //   expect(controller.numberOfFollowers[mockAnotherUser.id], equals(1));
  // });
}

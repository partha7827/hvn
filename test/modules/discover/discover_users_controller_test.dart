import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/modules/discover/users/discover_users.dart';
import 'package:highvibe/modules/discover/users/discover_users_controller.dart';
import 'package:highvibe/modules/discover/discover_controller.dart';
import 'package:highvibe/modules/discover/discover_module.dart';
import 'package:highvibe/services/store_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  initModule(DiscoverUsers(), changeBinds: [
    Bind<StoreService>((i) => StoreService.withMock()),
  ]);

  DiscoverUsersController controller;
  AppStore appStore;

  setUp(() {
    controller = Modular.get<DiscoverUsersController>();
    appStore = Modular.get<AppStore>();
  });

  test("controller", () async {
    expect(controller, isInstanceOf<DiscoverUsersController>());
  });

  test("load users", () async {
    await controller.loadUsers();

    expect(controller.users.toList(), equals([mockUser, mockAnotherUser]));
  });

  test("follow user", () async {
    await appStore.setCurrentUser(mockUser);
    
    await controller.followUser(mockAnotherUser.id);

    expect(controller.isFollowing[mockAnotherUser.id], equals(true));
    expect(controller.numberOfFollowers[mockAnotherUser.id], equals(1));
  });
}

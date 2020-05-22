import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/modules/home/home_controller.dart';
import 'package:highvibe/modules/home/home_module.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  initModule(HomeModule(), changeBinds: [
    Bind<AuthService>((i) => AuthService.withMock()),
    Bind<StoreService>((i) => StoreService.withMock()),
  ]);

  HomeController home;
  AppStore appStore;

  setUp(() {
    home = Modular.get<HomeController>();
    appStore = Modular.get<AppStore>();
  });

  test("controller", () async {
    expect(home, isInstanceOf<HomeController>());
  });

  test("logout", () async {
    await appStore.setCurrentUser(mockUser);
    expect(appStore.authState, equals(AuthState.authenticated));

    await home.logout();
    expect(appStore.authState, equals(AuthState.unauthenticated));
  });

//  test("getAuthors", () async {
//    final authors = await home.getAuthors();
//
//    expect(authors[0], equals(mockUser));
//  });

  test("getVideos", () async {
    final videos = await home.getVideos();

    expect(videos[0], equals(mockVideo));
  });
}

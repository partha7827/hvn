import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hvn/mocks/mock_database.dart';
import 'package:hvn/modules/app/app_store.dart';
import 'package:hvn/modules/auth/auth_module.dart';

import 'package:hvn/modules/auth/login/login_controller.dart';
import 'package:hvn/services/auth_service.dart';
import 'package:hvn/services/store_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  initModule(AuthModule(), changeBinds: [
    Bind<StoreService>((i) => StoreService.withMock()),
    Bind<AuthService>((i) => AuthService.withMock()),
  ]);

  AppStore appStore;
  LoginController login;

  setUp(() {
    appStore = AuthModule.to.get<AppStore>();
    login = AuthModule.to.get<LoginController>();
  });

  group('LoginController Test', () {
    test("initModule", () {
      expect(login, isInstanceOf<LoginController>());
    });

    test("loginUser", () async {
      await login.loginUser();

      expect(appStore.currentUser, equals(mockUser));
      expect(login.inProgress, equals(false));
    });

    test("resetPassword", () async {
      await login.resetPassword("default@gmail.com");

      expect(login.inProgress, equals(false));
    });
  });
}

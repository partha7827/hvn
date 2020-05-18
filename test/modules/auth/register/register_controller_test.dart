import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/modules/auth/auth_module.dart';

import 'package:highvibe/modules/auth/register/register_controller.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';

void main() {
  initModule(AuthModule(), changeBinds: [
    Bind<StoreService>((i) => StoreService.withMock()),
    Bind<AuthService>((i) => AuthService.withMock()),
  ]);
  RegisterController register;
  AppStore appStore;

  setUp(() {
    register = AuthModule.to.get<RegisterController>();
    appStore = AuthModule.to.get<AppStore>();
  });

  group('RegisterController Test', () {
    test("initModule", () {
      expect(register, isInstanceOf<RegisterController>());
    });

    test("registerUser", () async {
      await register.registerUser();

      expect(appStore.currentUser.account, equals("default"));
    });
  });
}

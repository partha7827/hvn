import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/mocks/mock_database.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/modules/auth/auth_module.dart';

import 'package:highvibe/modules/auth/login/login_controller.dart';
import 'package:highvibe/utils/utils.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  initModule(AuthModule(), changeBinds: [
    Bind<Firestore>((i) => getMockFirestore()),
    Bind<FirebaseAuth>((i) => getMockAuth()),
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

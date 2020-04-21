import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:highvibe/app/auth/user_store.dart';
import 'package:highvibe/app/auth/auth_module.dart';

void main() {
  initModule(AuthModule());
  // UserStore user;
  //
  setUp(() {
    //     user = AuthModule.to.get<UserStore>();
  });

  group('UserStore Test', () {
    //   test("First Test", () {
    //     expect(user, isInstanceOf<UserStore>());
    //   });

    //   test("Set Value", () {
    //     expect(user.value, equals(0));
    //     user.increment();
    //     expect(user.value, equals(1));
    //   });
  });
}

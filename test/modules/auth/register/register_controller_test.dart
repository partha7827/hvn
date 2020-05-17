import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/modules/auth/auth_module.dart';

import 'package:highvibe/modules/auth/register/register_controller.dart';

void main() {
  initModule(AuthModule());
  RegisterController register;

  setUp(() {
    register = AuthModule.to.get<RegisterController>();
  });

  group('RegisterController Test', () {
    test("initModule", () {
      expect(register, isInstanceOf<RegisterController>());
    });
  });
}

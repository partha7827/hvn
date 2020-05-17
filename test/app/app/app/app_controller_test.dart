import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:highvibe/app/app/app_module.dart';
import 'package:highvibe/store/current_user_store.dart';

void main() {
  initModule(AppModule());
  // AppController app;

  CurrentUserStore currentUser;

  //
  setUp(() {
    currentUser = AppModule.to.get<CurrentUserStore>();
  });

  group('CurrentUserStore Test', () {
      test("First Test", () {
        expect(currentUser, isInstanceOf<CurrentUserStore>());
      });

      // test("Set Value", () {
      //   expect(app.value, equals(0));
      //   app.increment();
      //   expect(app.value, equals(1));
      // });
  });
}

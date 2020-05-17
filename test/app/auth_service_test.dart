import 'package:highvibe/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/mocks/firebase_auth_mocks_base.dart';

main() async {
  test("login with email and password", () async {
    final auth = MockFirebaseAuth();

    final service = AuthService(auth);

    String uid = await service.login("email", "password");

    expect(uid, equals("aabbcc"));
  });
}

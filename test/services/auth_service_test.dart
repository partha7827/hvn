import 'package:highvibe/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:highvibe/mocks/firebase_auth_mocks_base.dart';

void main() async {
  test('login with email and password', () async {
    final auth = MockFirebaseAuth();

    final service = AuthService(auth);

    final uid = await service.login('email', 'password');

    expect(uid, equals('default'));
  });
}

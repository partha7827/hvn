import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

import 'mock_id_token_result.dart';

class MockFirebaseUser extends Mock implements FirebaseUser {
  @override
  String get displayName => 'Default User';

  @override
  String get uid => 'default';

  @override
  Future<IdTokenResult> getIdToken({bool refresh = false}) async {
    return Future.value(MockIdTokenResult());
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hvn/mocks/firebase_auth_mocks_base.dart';
import 'package:hvn/models/models.dart' show User;

class AuthService extends Disposable {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  factory AuthService.withFirebase() => AuthService(FirebaseAuth.instance);

  factory AuthService.withMock() =>
      AuthService(MockFirebaseAuth(signedIn: true));

  Future<String> anonymousLogin() async {
    final response = await _auth.signInAnonymously();
    return response?.user?.uid;
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  Future<User> emailRegister({
    String email,
    String password,
    String name,
  }) async {
    final response = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = response.user;

    await user.sendEmailVerification();

    return User(
      (b) => b
        ..id = user.uid
        ..chatId = user.uid
        ..liveId = user.uid
        ..email = email
        ..name = name,
    );
  }

  Future<String> getUid() async {
    final user = await _auth.currentUser();
    return user?.uid;
  }

  Future<String> login(String email, String password) async {
    final response = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return response?.user?.uid;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}

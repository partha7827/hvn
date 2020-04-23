import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/user_store.dart';

class AuthRepository extends Disposable {
  final _auth = FirebaseAuth.instance;
  
  Future<String> getUid() async {
    final user = await _auth.currentUser();

    return user?.uid;
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<String> login(String email, String password) async {
    final response = await _auth.signInWithEmailAndPassword(email: email, password: password);

    return response?.user?.uid;
  }

  Future<String> anonymousLogin() async {
    final response = await _auth.signInAnonymously();

    return response?.user?.uid;
  }

  Future<User> emailRegister({ String email, String password, String name }) async {
    final response = await _auth.createUserWithEmailAndPassword(email: email, password: password);

    final user = response.user;

    await user.sendEmailVerification();

    return User.createNew(uid: user.uid, email: email, name: name);
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}

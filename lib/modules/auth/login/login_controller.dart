import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/modules/auth/exceptions.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final auth = Modular.get<AuthService>();
  final firestore = Modular.get<StoreService>();
  final appStore = Modular.get<AppStore>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @observable
  bool inProgress = false;

  @observable
  bool inProgressGoogleSignIn = false;

  @action
  Future<void> loginUser() async {
    inProgress = true;

    try {
      final uid =
          await auth.login(emailController.text, passwordController.text);

      if (uid == null) throw LoginException(Strings.userNotFound);

      final user = await firestore.userCollection.document(uid).get();

      if (!user.exists) throw LoginException(Strings.userNotFound);

      appStore.setCurrentUser(User.fromSnapshot(user));
    } catch (e) {
      throw e;
    } finally {
      inProgress = false;
    }
  }

  @action
  Future<void> googleSignIn() async {
    inProgressGoogleSignIn = true;

    try {
      final googleSignInAccount = await _getGoogleUser();
      final googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final AuthResult authResult =
          await _firebaseAuth.signInWithCredential(credential);
      FirebaseUser firebaseUser = authResult.user;

      if (firebaseUser.uid != null) {
        debugPrint('googlogin userName: ${firebaseUser.uid}');
        final user =
            await firestore.userCollection.document(firebaseUser.uid).get();
        if (!user.exists) throw LoginException(Strings.userNotFound);
        appStore.setCurrentUser(User.fromSnapshot(user));
      } else {
        throw LoginException(Strings.userNotFound);
      }
    } catch (e) {
      throw e;
    } finally {
      inProgressGoogleSignIn = false;
    }
  }

  @action
  Future<void> resetPassword(String email) async {
    await auth.sendPasswordResetEmail(email);
  }

  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  Future _getGoogleUser() async {
    GoogleSignInAccount googleUser = _googleSignIn.currentUser;

    googleUser ??= await _googleSignIn.signInSilently();
    googleUser ??= await _googleSignIn.signIn();

    return googleUser;
  }
}

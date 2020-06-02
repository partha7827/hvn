import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/auth/exceptions.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthService auth = Modular.get<AuthService>();
  final FirestoreService firestore = Modular.get<FirestoreService>();
  final AppController appStore = Modular.get<AppController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  bool inProgress = false;

  @observable
  bool inProgressGoogleSignIn = false;

  @action
  Future<void> loginUser() async {
    inProgress = true;

    try {
      final uid = await auth.login(
        emailController.text,
        passwordController.text,
      );

      if (uid == null) throw LoginException(Strings.userNotFound);

      final user = await firestore.userCollection.document(uid).get();

      if (!user.exists) throw LoginException(Strings.userNotFound);

      await appStore.setCurrentUser(User.fromSnapshot(user));
    } catch (e) {
      rethrow;
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

      final credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final authResult = await _firebaseAuth.signInWithCredential(credential);
      final firebaseUser = authResult.user;

      if (firebaseUser.uid != null) {
        debugPrint('googlogin userName: ${firebaseUser.uid}');
        var userSnapshot =
            await firestore.userCollection.document(firebaseUser.uid).get();
        if (!userSnapshot.exists) {
          // set user data in firebase
          await firestore.userCollection.document(firebaseUser.uid).setData({
            'id': firebaseUser.uid,
            'email': firebaseUser.email,
            'name': firebaseUser.displayName,
          });
          userSnapshot =
              await firestore.userCollection.document(firebaseUser.uid).get();
        }
        await appStore.setCurrentUser(User.fromSnapshot(userSnapshot));
      } else {
        throw LoginException(Strings.userNotFound);
      }
    } catch (e) {
      rethrow;
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

  Future<GoogleSignInAccount> _getGoogleUser() async {
    var googleUser = _googleSignIn.currentUser;

    if (googleUser != null) {
      googleUser ??= await _googleSignIn.signInSilently();
    } else {
      googleUser ??= await _googleSignIn.signIn();
    }

    return googleUser;
  }
}

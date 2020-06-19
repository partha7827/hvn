import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/auth/exceptions.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:mobx/mobx.dart';

part 'register_with_sms_controller.g.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FacebookLogin _facebookLogin = FacebookLogin();
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class RegisterWithSmsController = _RegisterWithSmsControllerBase
    with _$RegisterWithSmsController;

abstract class _RegisterWithSmsControllerBase with Store {
  final AuthService auth = Modular.get<AuthService>();
  final FirestoreService firestore = Modular.get<FirestoreService>();
  final AppController appStore = Modular.get<AppController>();

  final TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  bool hasAcceptedTerms = false;

  @observable
  bool inProgress = false;

  @observable
  bool inProgressGoogleSignIn = false;

  @observable
  bool inProgressFacebookLogIn = false;

  @action
  Future<void> facebookLogin() async {
    inProgressFacebookLogIn = true;
    try {
      final _facebookLoginResult =
          await _facebookLogin.logIn(['email', 'public_profile']);

      switch (_facebookLoginResult.status) {
        case FacebookLoginStatus.loggedIn:
          final facebookToken = _facebookLoginResult.accessToken.token;

          final authCredential =
              FacebookAuthProvider.getCredential(accessToken: facebookToken);

          final authResult =
              await _firebaseAuth.signInWithCredential(authCredential);

          final firebaseUser = authResult.user;

          if (firebaseUser.uid != null) {
            var userSnapshot =
                await firestore.userCollection.document(firebaseUser.uid).get();
            if (!userSnapshot.exists) {
              // set user data in firebase
              await firestore.userCollection
                  .document(firebaseUser.uid)
                  .setData({
                'id': firebaseUser.uid,
                'email': firebaseUser.email,
                'name': firebaseUser.displayName,
              });
              userSnapshot = await firestore.userCollection
                  .document(firebaseUser.uid)
                  .get();
            }
            await appStore.setCurrentUser(User.fromSnapshot(userSnapshot));
          } else {
            throw LoginException(Strings.userNotFound);
          }
          break;
        case FacebookLoginStatus.cancelledByUser:
          print('user cancelled login with facebook');
          break;
        case FacebookLoginStatus.error:
          throw LoginException(Strings.facebookLoginError);
          break;
      }
    } catch (e) {
      rethrow;
    } finally {
      inProgressFacebookLogIn = false;
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

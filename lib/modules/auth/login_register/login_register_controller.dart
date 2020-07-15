import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/user/user.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/auth/auth_module.dart';
import 'package:highvibe/modules/auth/exceptions.dart';
import 'package:highvibe/services/firestore_service.dart';
import 'package:highvibe/values/strings.dart';
import 'package:mobx/mobx.dart';

part 'login_register_controller.g.dart';

enum AuthState { initial, authenticated, unauthenticated }

class LoginRegisterController = _LoginRegisterControllerBase
    with _$LoginRegisterController;

abstract class _LoginRegisterControllerBase with Store {
  final AppController appStore = Modular.get<AppController>();
  final FirestoreService firestore = Modular.get<FirestoreService>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void toLogin() {
    AuthModule.toLogin();
  }

  void toRegister() {
    AuthModule.toRegister();
  }

  Future<void> skipAndExplore() async {
    // Skip and explore
    try {
      final _authResult = await FirebaseAuth.instance.signInAnonymously();

      DocumentSnapshot userSnapshot;
      try {
        userSnapshot =
            await firestore.userCollection.document(_authResult.user.uid).get();
        
        // If user doesn't exist in firebase
        if (userSnapshot.data == null) {
          // set user data in firebase
          await firestore.userCollection
              .document(_authResult.user.uid)
              .setData({
            'id': _authResult.user.uid,
            'name': _authResult.user.displayName,
          });
          userSnapshot = await firestore.userCollection
              .document(_authResult.user.uid)
              .get();
        }
      } catch (e) {
        if (userSnapshot == null || !userSnapshot.exists) {
          throw LoginException(Strings.userNotFound);
        }
      }

      await appStore.setCurrentUser(User.fromSnapshot(userSnapshot));
    } catch (e) {
      print(e);
    }
  }
}

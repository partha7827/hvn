import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/models/models.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/modules/auth/exceptions.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';
import 'package:highvibe/values/Strings.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

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

  @action
  Future<void> loginUser() async {
    inProgress = true;

    final uid = await auth.login(emailController.text, passwordController.text);

    if (uid == null) throw LoginException(Strings.userNotFound);

    final user = await firestore.userCollection.document(uid).get();

    if (!user.exists) throw LoginException(Strings.userNotFound);

    appStore.setCurrentUser(User.fromSnapshot(user));

    inProgress = false;
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
}

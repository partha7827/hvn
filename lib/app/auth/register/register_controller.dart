import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/user_service.dart';
import 'package:highvibe/store/current_user_store.dart';
import 'package:highvibe/utils.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final authRepo = Modular.get<AuthService>();
  final userRepo = Modular.get<UserService>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @observable
  bool inProgress = false;

  @observable
  bool hasAcceptedTerms = false;

  @action
  Future<void> registerUser() async {
    if (!formKey.currentState.validate() || !hasAcceptedTerms) {
      return;
    }

    inProgress = true;

    try {
      final user = await authRepo.emailRegister(
          email: emailController.text,
          password: passwordController.text,
          name: usernameController.text);

      await userRepo.createNewUser(user);

      await Modular.get<CurrentUserStore>().login(user.id);
    } catch (e) {
      showSnackBarMsg(scaffoldKey.currentState, e.toString());
    }

    inProgress = false;
  }

  @action
  Future<void> resetPassword(String email) async {
    try {
      await authRepo.sendPasswordResetEmail(email);
      showSnackBarMsg(scaffoldKey.currentState,
          "Email Sent, please check to change password");
    } catch (e) {
      showSnackBarMsg(scaffoldKey.currentState, e.toString());
    }
  }
}

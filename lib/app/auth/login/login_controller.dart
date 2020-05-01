import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:highvibe/app/auth/auth_repository.dart';
import 'package:highvibe/app/auth/user_repository.dart';
import 'package:highvibe/utils.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final authRepo = Modular.get<AuthRepository>();
  final userRepo = Modular.get<UserRepository>();

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

    try {
      if (!formKey.currentState.validate()) return null;

      final uid =
          await authRepo.login(emailController.text, passwordController.text);

      if (uid == null) {
        showSnackBarMsg(
            scaffoldKey.currentState, 'User not found, Please check password');
      } else {
        await Modular.get<AuthController>().login(uid);
      }
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
          'Email Sent, Please check it to change password');
    } catch (e) {
      showSnackBarMsg(scaffoldKey.currentState, e.toString());
    }
  }

  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_controller.dart';
import 'package:highvibe/modules/auth/auto_login/auto_login_controller.dart';
import 'package:highvibe/modules/auth/auto_login/auto_login_page.dart';
import 'package:highvibe/modules/auth/login/login_controller.dart';
import 'package:highvibe/modules/auth/login/login_page.dart';
import 'package:highvibe/modules/auth/register/register_controller.dart';
import 'package:highvibe/modules/auth/register/register_page.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/firestore_service.dart';

import 'login/forgot_password_page.dart';
import 'login/thank_you_page.dart';

class AuthModule extends ChildModule {
  static Inject<AuthModule> get to => Inject<AuthModule>.of();

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => AppController()),
        Bind<FirestoreService>((i) => FirestoreService.withFirebase()),
        Bind<AuthService>((i) => AuthService.withFirebase()),
        Bind((i) => AutoLoginController()),
        Bind((i) => LoginController()),
        Bind((i) => RegisterController()),
      ];

  @override
  List<Router<Object>> get routers => [
        Router('/autologin', child: (_, args) => const AutoLoginPage()),
        Router('/register', child: (_, args) => const RegisterPage()),
        Router('/login', child: (_, args) => const LoginPage()),
        Router(
          '/forgotPassword',
          child: (_, args) => ForgotPasswordPage(email: args.data),
        ),
        Router('/thankYou', child: (_, args) => ThankYouPage(email: args.data)),
      ];

  static Future<Object> toForgotPassword(String email) =>
      Modular.to.pushNamed('/forgotPassword', arguments: email);

  static Future<Object> toLogin() => Modular.to.pushNamed('/login');

  static Future<Object> toRegister() => Modular.to.pushNamed('/register');

  static Future<Object> toThankYouPage(String args) =>
      Modular.to.pushReplacementNamed('/thankYou', arguments: args);
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/modules/app/app_store.dart';
import 'package:highvibe/modules/auth/auto_login/auto_login_controller.dart';
import 'package:highvibe/modules/auth/auto_login/auto_login_page.dart';
import 'package:highvibe/modules/auth/login/login_controller.dart';
import 'package:highvibe/modules/auth/login/login_page.dart';
import 'package:highvibe/modules/auth/register/register_controller.dart';
import 'package:highvibe/modules/auth/register/register_page.dart';
import 'package:highvibe/services/auth_service.dart';
import 'package:highvibe/services/store_service.dart';

import 'login/forgot_password_page.dart';
import 'login/thank_you_page.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppStore()),
        Bind<StoreService>((i) => StoreService.withFirebase()),
        Bind<AuthService>((i) => AuthService.withFirebase()),
        Bind((i) => AutoLoginController()),
        Bind((i) => LoginController()),
        Bind((i) => RegisterController()),
      ];

  @override
  List<Router> get routers => [
        Router('/autologin', child: (_, args) => AutoLoginPage()),
        Router('/register', child: (_, args) => RegisterPage()),
        Router('/login', child: (_, args) => LoginPage()),
        Router('/forgotPassword',
            child: (_, args) => ForgotPasswordPage(
                  email: args.data,
                )),
        Router('/thankYou', child: (_, args) => ThankYouPage(email: args.data)),
      ];

  static Inject get to => Inject<AuthModule>.of();

  static Future toRegister() => Modular.to.pushNamed('/register');

  static Future toLogin() => Modular.to.pushNamed("/login");

  static Future toForgotPassword(email) =>
      Modular.to.pushNamed("/forgotPassword", arguments: email);

  static Future toThankYouPage(args) =>
      Modular.to.pushReplacementNamed("/thankYou", arguments: args);
}

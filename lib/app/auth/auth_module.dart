import 'package:highvibe/app/auth/auto_login/auto_login_controller.dart';
import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:highvibe/app/auth/auto_login/auto_login_page.dart';
import 'package:highvibe/app/auth/login/login_controller.dart';
import 'package:highvibe/app/auth/login/login_page.dart';
import 'package:highvibe/app/auth/register/register_controller.dart';
import 'package:highvibe/app/auth/register/register_page.dart';
import 'package:highvibe/app/auth/user_store.dart';
import 'package:highvibe/app/auth/auth_repository.dart';
import 'package:highvibe/app/auth/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:highvibe/app/home/home_controller.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AutoLoginController()),
        Bind((i) => User()),
        Bind((i) => AuthRepository()),
        Bind((i) => UserRepository()),
        Bind((i) => AuthController()),
        Bind((i) => LoginController()),
        Bind((i) => RegisterController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AutoLoginPage()),
        Router('/register', child: (_, args) => RegisterPage()),
        Router('/login', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();

  static Future toRegister() => Modular.to.pushNamed('/register');

  static Future toLogin() => Modular.to.pushNamed("/login");
}

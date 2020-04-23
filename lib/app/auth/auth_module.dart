import 'package:highvibe/app/auth/auth_controller.dart';
import 'package:highvibe/app/auth/register/register_page.dart';
import 'package:highvibe/app/auth/splash/splash_page.dart';
import 'package:highvibe/app/auth/user_store.dart';
import 'package:highvibe/app/auth/auth_repository.dart';
import 'package:highvibe/app/auth/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => User()),
        Bind((i) => AuthRepository()),
        Bind((i) => UserRepository()),
        Bind((i) => AuthController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SplashPage()),
        Router('/register', child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<AuthModule>.of();

  static Future toRegister() => Modular.to.pushNamed('/register');
}